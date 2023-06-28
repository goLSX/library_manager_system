#include "sigh_up.h"
#include "ui_sigh_up.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QValidator>
#include <QCryptographicHash>  //md5加密的库
extern sigh_up *s;

sigh_up::sigh_up(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::sigh_up)
{
    ui->setupUi(this);
    QRegExp exp("[0-9]+$");
    QValidator *Validator = new QRegExpValidator(exp);
    ui->sigh_up_id_num->setValidator(Validator);
    ui->sigh_up_phone_num->setValidator(Validator);
}

sigh_up::~sigh_up()
{
    delete ui;
}

void sigh_up::on_sigh_up_confirm_clicked()
{
    QString reader_name = ui->sigh_up_reader_name->text();
    QString name = ui->sigh_up_name->text();
    QString id_num = ui->sigh_up_id_num->text();
    QString phone_num = ui->sigh_up_phone_num->text();
    QString password = ui->sigh_up_password->text();

    if(password != ui->sigh_up_password2->text())
    {
        QMessageBox::information(this, "infor", "两次密码不一致");
        return;
    }
    if(password.size() < 6 )
    {
        QMessageBox::information(this, "infor", "密码太短");
        return;
    }
    if(id_num.size() != 15 and id_num.size() != 18 )
    {
        QMessageBox::information(this, "infor", "身份证长度不正确");
        return;
    }
    if(phone_num.size() != 11 )
    {
        QMessageBox::information(this, "infor", "手机号长度不正确");
        return;
    }

    QSqlQuery sqlQuery(QSqlDatabase::database("checker_connection")); // 指定使用checker连接

    QString sql = QObject::tr(" call check_reader_sigh_up('%1','%2',@result)").arg(reader_name,id_num);

    qDebug() << "执行结果 " << sqlQuery.exec(sql) << endl;   //检查用户注册信息是否已存在
    qDebug() << "结果size " << sqlQuery.size() << endl;

    while(sqlQuery.next())
    {
         if(sqlQuery.value(0).toString() != "OK")
         {
             QMessageBox::information(this, "infor", sqlQuery.value(0).toString());
             return;
         }
    }
    password = QCryptographicHash::hash(password.toLatin1(),QCryptographicHash::Md5).toHex();   //求md5

    sql = QObject::tr(" call insert_reader('%1','%2','%3','%4','%5')").arg
            (reader_name,password,name,id_num,phone_num);
    if(sqlQuery.exec(sql) )   //注册用户账号
    {
        QMessageBox::information(this, "infor", "注册成功");
    }
    sqlQuery.finish();
   s->hide();
   delete s;
}
