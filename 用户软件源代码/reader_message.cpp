#include "reader_message.h"
#include "ui_reader_message.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QRegExpValidator>
reader_message::reader_message(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::reader_message)
{
    ui->setupUi(this);
    ui->confirm->hide();




    QSqlQuery sqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接
    QString sql;
    extern QString user_name;
    sql = QObject::tr(" call select_reader_message('%1')").arg(user_name);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错");
        return;
    }
    while(sqlQuery.next())
    {
        ui->reader_name->setText(sqlQuery.value(0).toString());
        ui->name->setText(sqlQuery.value(1).toString());
        ui->id_num->setText(sqlQuery.value(2).toString());
        ui->age->setText(sqlQuery.value(3).toString());
        ui->phone_num->setText(sqlQuery.value(4).toString());
    }
    sqlQuery.finish();

}

reader_message::~reader_message()
{
    delete ui;
}



void reader_message::on_change_clicked()
{
    ui->change->hide();
    ui->confirm->show();
    ui->name->setStyleSheet("");
    ui->name->setReadOnly(false);
    ui->id_num->setStyleSheet("");
    ui->id_num->setReadOnly(false);
    ui->phone_num->setStyleSheet("");
    ui->phone_num->setReadOnly(false);
    QRegExp exp("[0-9]+$");
    QValidator *Validator = new QRegExpValidator(exp);
    ui->id_num->setValidator(Validator);
    ui->phone_num->setValidator(Validator);

}

void reader_message::on_confirm_clicked()
{
    QString name = ui->name->text();
    QString id_num = ui->id_num->text();
    QString phone_num = ui->phone_num->text();
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


    QSqlQuery sqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接

    QString sql;
    extern QString user_name;

    sql = QObject::tr(" call update_reader_message('%1','%2','%3','%4')").arg(user_name,name,id_num,phone_num);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "修改出错");
        return;
    }
    QMessageBox::information(this, "infor", "修改成功");
    sqlQuery.finish();

    extern reader_message *r;
    r->hide();
    delete  r;
    r = nullptr;

}
