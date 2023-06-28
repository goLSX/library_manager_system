#include "change_password.h"
#include "ui_change_password.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QCryptographicHash>

extern bool build_checker();
extern QString user_type;
change_password::change_password(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::change_password)
{
    ui->setupUi(this);
}

change_password::~change_password()
{
    delete ui;
}


void change_password::on_confirm_clicked()
{
    if(ui->password->text() != ui->password2->text())
    {
        QMessageBox::information(this, "infor", "两次密码不一致");
        return;
    }
    if(ui->password->text().size() < 6)
    {
        QMessageBox::information(this, "infor", "新密码太短,至少要6位");
        return;
    }

    if(!build_checker())    //建立checker连接
    {
        QMessageBox::information(this, "infor", "checker连接建立失败");
        return;
    }

    QSqlQuery *sqlQuery = new QSqlQuery(QSqlDatabase::database("checker_connection")); // 指定使用checker连接
    QString sql;
    extern QString user_name;
    QString password = QCryptographicHash::hash(ui->old_password->text().toLatin1(),QCryptographicHash::Md5).toHex();   //求旧密码md5
    if(user_type == "读者")
    {
        sql = QObject::tr(" call check_reader('%1','%2',@result)").arg(user_name,password);
    }
    else if(user_type == "图书管理员")
    {
        sql = QObject::tr(" call check_manager('%1','%2',@result)").arg(user_name,password);
    }

    qDebug() << "用户检查sql执行成功 " << sqlQuery->exec(sql) << endl;   //检查用户信息是否正确
   // qDebug() << "结果size " << sqlQuery.size() << endl;
    while(sqlQuery->next())
    {                                              // sql检验用户不正确
         if(sqlQuery->value(0).toString() == "错误")
         {
             QMessageBox::information(this, "infor", "原密码错误");
             return;
         }
         if(sqlQuery->value(0).toString() == "注销")
         {
             QMessageBox::information(this, "infor", "账号已注销");
             return;
         }
    }

    sqlQuery->finish();
    delete  sqlQuery;
    QSqlDatabase::database("checker_connection").close();       //关闭checker连接
    QSqlDatabase::removeDatabase("checker_connection");         //从列表删除



    password = QCryptographicHash::hash(ui->password->text().toLatin1(),QCryptographicHash::Md5).toHex();   //求新密码md5
    if(user_type == "读者")
    {
        sqlQuery = new QSqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接
        sql = QObject::tr(" call update_reader_password('%1','%2')").arg(user_name,password);
    }
    else if(user_type == "图书管理员")
    {
        sqlQuery = new QSqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
        sql = QObject::tr(" call update_manager_password('%1','%2')").arg(user_name,password);
    }

    if(!sqlQuery->exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错");
        return;
    }
    QMessageBox::information(this, "infor", "修改成功");

    extern change_password *c;
    c->hide();
    delete c;
    c = nullptr;
}
