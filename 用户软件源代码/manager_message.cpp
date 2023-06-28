#include "manager_message.h"
#include "ui_manager_message.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
#include <QDate>

extern QString user_type;


manager_message::manager_message(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::manager_message)
{
    ui->setupUi(this);
    if(user_type == "系统管理员")
    {
        ui->confirm->hide();
        ui->change->hide();
        ui->entry_time->hide();
        ui->manager_change->hide();
        ui->manager_confirm->hide();
    }
    else if(user_type == "图书管理员")
    {
        ui->widget_3->hide();
        ui->state_label->hide();
//        ui->state->hide();
        ui->manager_confirm->hide();
        QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
        QString sql;
        extern QString user_name;
        sql = QObject::tr(" call select_manager_message('%1')").arg(user_name);

        qDebug() << "查询图书管理员信息sql执行成功  " << sqlQuery.exec(sql) << endl;   //检查图书管理员用户信息是否存在
        if(!sqlQuery.size())
        {
            QMessageBox::information(this, "infor", "数据库查询您的信息失败");
            return;
        }

        while(sqlQuery.next())        //读取返回结果
        {
             ui->entry_time->show();

             ui->manager_name_display->setText(sqlQuery.value(0).toString());
             ui->name->setText(sqlQuery.value(1).toString());
             ui->id_num->setText(sqlQuery.value(2).toString());
             ui->age->setText(sqlQuery.value(3).toString());
             ui->phone_num->setText(sqlQuery.value(4).toString());
             ui->entry_time->setDate(QDate::fromString(sqlQuery.value(5).toString(),"yyyy-M-d"));
             ui->work_position->setText(sqlQuery.value(6).toString());

        }
        sqlQuery.finish();
    }

}

manager_message::~manager_message()
{
    delete ui;
}

void manager_message::on_query_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("sysmanager_connection")); // 指定使用sysmanager连接
    QString sql;
    sql = QObject::tr(" call select_manager_message('%1')").arg(ui->manager_name->text());

    qDebug() << "查询图书管理员信息sql执行成功  " << sqlQuery.exec(sql) << endl;   //检查图书管理员用户信息是否存在
    if(!sqlQuery.size())
    {
        QMessageBox::information(this, "infor", "查无此人,请确认输入");
        return;
    }

    while(sqlQuery.next())        //读取返回结果
    {
         ui->entry_time->show();

         ui->manager_name_display->setText(sqlQuery.value(0).toString());
         ui->name->setText(sqlQuery.value(1).toString());
         ui->id_num->setText(sqlQuery.value(2).toString());
         ui->age->setText(sqlQuery.value(3).toString());
         ui->phone_num->setText(sqlQuery.value(4).toString());
         ui->entry_time->setDate(QDate::fromString(sqlQuery.value(5).toString(),"yyyy-M-d"));
         ui->work_position->setText(sqlQuery.value(6).toString());
         ui->state->setText(sqlQuery.value(7).toString());
    }
    sqlQuery.finish();
    ui->change->show();
}

void manager_message::on_change_clicked()
{
    ui->query->hide();
    ui->confirm->show();
    ui->change->hide();
    ui->manager_name->hide();
    ui->work_position->setStyleSheet("");
    ui->work_position->setReadOnly(false);
    ui->state->setStyleSheet("");
    ui->state->setReadOnly(false);


}

void manager_message::on_confirm_clicked()
{
    if(ui->state->text() != "正常" && ui->state->text() != "注销")
    {
        QMessageBox::information(this, "infor", "账号状态不合法 正常/注销");
        return;
    }
    QSqlQuery sqlQuery(QSqlDatabase::database("sysmanager_connection")); // 指定使用sysmanager连接
    QString sql;
    sql = QObject::tr(" call update_manager_work('%1','%2','%3')").arg
            (ui->manager_name->text(),ui->work_position->text(),ui->state->text());
    if(sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "修改成功");
    }
    else
    {
         QMessageBox::information(this, "infor", "修改工作信息sql执行失败");
         return;
    }
    ui->confirm->hide();
    ui->change->show();
    ui->query->show();
    ui->manager_name->show();
    ui->work_position->setStyleSheet("background:transparent;border-width:0;border-style:outset");
    ui->work_position->setReadOnly(true);
    ui->state->setStyleSheet("background:transparent;border-width:0;border-style:outset");
    ui->state->setReadOnly(true);
}

void manager_message::on_manager_change_clicked()
{
    ui->manager_change->hide();
    ui->manager_confirm->show();

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

void manager_message::on_manager_confirm_clicked()
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

    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接

    QString sql;
    extern QString user_name;

    sql = QObject::tr(" call update_manager_message('%1','%2','%3','%4')").arg(user_name,name,id_num,phone_num);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "修改出错");
        return;
    }
    QMessageBox::information(this, "infor", "修改成功");
    sqlQuery.finish();


    extern manager_message *mme;
    mme->hide();
    delete  mme;
    mme = nullptr;
}
