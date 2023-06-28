#include "manager_sigh_up.h"
#include "ui_manager_sigh_up.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QValidator>
#include <QCryptographicHash>  //md5加密的库

extern manager_sigh_up *m;

manager_sigh_up::manager_sigh_up(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::manager_sigh_up)
{
    ui->setupUi(this);
    QRegExp exp("[0-9]+$");
    QValidator *Validator = new QRegExpValidator(exp);
    ui->id_num->setValidator(Validator);
    ui->phone_num->setValidator(Validator);
}

manager_sigh_up::~manager_sigh_up()
{
    delete ui;
}

void manager_sigh_up::on_confirm_clicked()
{
    QString manager_name = ui->manager_name->text();
    QString name = ui->name->text();
    QString id_num = ui->id_num->text();
    QString phone_num = ui->phone_num->text();
    QString entry_time = ui->entry_time->text();
    QString work_position = ui->work_position->text();
    if(ui->password->text() != ui->password2->text())
    {
        QMessageBox::information(this, "infor", "两次密码不一致");
        return;
    }
    if(ui->password->text().size() < 6 )
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
    if(work_position == "")
    {
        QMessageBox::information(this, "infor", "工作位置不能为空");
        return;
    }



    QSqlQuery sqlQuery(QSqlDatabase::database("sysmanager_connection")); // 指定使用sysmanager连接
    QString sql;
    sql = QObject::tr(" call check_manager_sigh_up('%1','%2',@result)").arg(manager_name,id_num);

    qDebug() << "检查注册信息sql执行成功  " << sqlQuery.exec(sql) << endl;   //检查图书管理员用户注册信息是否已存在
    //qDebug() << "结果size " << sqlQuery.size() << endl;

    while(sqlQuery.next())        //检查返回结果
    {
         if(sqlQuery.value(0).toString() != "OK")
         {
             QMessageBox::information(this, "infor", sqlQuery.value(0).toString());
             return;
         }
    }
    QString password = QCryptographicHash::hash(ui->password->text().toLatin1(),QCryptographicHash::Md5).toHex();   //求md5
    sql = QObject::tr(" call insert_manager('%1','%2','%3','%4','%5','%6','%7')").arg
            (manager_name,password,name,id_num,phone_num,entry_time,work_position);
    if(sqlQuery.exec(sql) )   //注册图书管理员账号
    {
        QMessageBox::information(this, "infor", "注册成功");
    }
    else
    {
         QMessageBox::information(this, "infor", "注册sql执行失败");
         return;
    }
    sqlQuery.finish();
    m->hide();
    delete m;
    m = nullptr;
}
