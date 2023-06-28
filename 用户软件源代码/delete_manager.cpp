#include "delete_manager.h"
#include "ui_delete_manager.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>

extern delete_manager *dm;

delete_manager::delete_manager(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::delete_manager)
{
    ui->setupUi(this);
}

delete_manager::~delete_manager()
{
    delete ui;
}

void delete_manager::on_confirm_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("sysmanager_connection")); // 指定使用sysmanager连接
    QString sql;
    sql = QObject::tr(" call select_manager_message('%1')").arg(ui->manager_name->text());

    qDebug() << "检查图书管理员存在sql执行成功  " << sqlQuery.exec(sql) << endl;   //检查图书管理员用户是否存在
    if(!sqlQuery.size())    //没有查到该图书管理员
    {
        QMessageBox::information(this, "infor", "没有该图书管理员");
        sqlQuery.finish();
        return;
    }
    sql = QObject::tr(" call delete_manager('%1')").arg(ui->manager_name->text());
    if(sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "删除成功");
    }
    else
    {
        QMessageBox::information(this, "infor", "删除失败");
    }

    sqlQuery.finish();
    dm->hide();
    delete dm;
    dm = nullptr;

}
