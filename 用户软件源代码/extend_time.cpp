#include "extend_time.h"
#include "ui_extend_time.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>

extend_time::extend_time(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::extend_time)
{
    ui->setupUi(this);
    ui->extend->hide();
}

extend_time::~extend_time()
{
    delete ui;
}

void extend_time::on_choose_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call select_borrow_by_booknum('%1')").arg
            (ui->book_num->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "查询书籍sql执行出错");
        return;
    }
    if(!sqlQuery.size())
    {
        QMessageBox::information(this, "infor", "没有此书的待还借阅信息");
        return;
    }
    while(sqlQuery.next())
    {
        ui->borrow_rec_num->setText(sqlQuery.value(0).toString());
        ui->reader_name->setText(sqlQuery.value(1).toString());
        ui->book_num_display->setText(sqlQuery.value(2).toString());
        ui->book_name->setText(sqlQuery.value(3).toString());
        ui->borrow_state->setText(sqlQuery.value(6).toString());
    }
    sqlQuery.finish();
    ui->extend->show();

}

void extend_time::on_extend_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call extend_time('%1',@result)").arg
            (ui->book_num->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "书籍延期sql执行出错");
        return;
    }
    while(sqlQuery.next())
    {
       QMessageBox::information(this, "infor", sqlQuery.value(0).toString());
    }
    sqlQuery.finish();
    extern extend_time *et;
    et->hide();
    delete et;
    et = nullptr;
}
