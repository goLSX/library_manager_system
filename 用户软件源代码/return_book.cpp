#include "return_book.h"
#include "ui_return_book.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>

return_book::return_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::return_book)
{
    ui->setupUi(this);
    ui->return_button->hide();
    ui->return_button_bad->hide();
}

return_book::~return_book()
{
    delete ui;
}

void return_book::on_choose_clicked()
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
    ui->return_button->show();
    ui->return_button_bad->show();
}

void return_book::on_return_button_clicked()
{

    extern QString user_name;
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call insert_return('%1',curdate(),'%2','%3',@result)").arg
            (ui->borrow_rec_num->text(),user_name,"正常");
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "归还书籍sql执行出错");
        return;
    }
    while(sqlQuery.next())
    {
        QMessageBox::information(this, "infor", "费用"+sqlQuery.value(0).toString());
    }
    sqlQuery.finish();
    extern return_book *rb;
    rb->hide();
    delete rb;
    rb = nullptr;
}

void return_book::on_return_button_bad_clicked()
{

    extern QString user_name;
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call insert_return('%1',curdate(),'%2','%3',@result)").arg
            (ui->borrow_rec_num->text(),user_name,"丢失");
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "归还书籍sql执行出错");
        return;
    }
    while(sqlQuery.next())
    {
        QMessageBox::information(this, "infor", "费用"+sqlQuery.value(0).toString());
    }
    sqlQuery.finish();
    extern return_book *rb;
    rb->hide();
    delete rb;
    rb = nullptr;
}
