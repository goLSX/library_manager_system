#include "borrow_book.h"
#include "ui_borrow_book.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
borrow_book::borrow_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::borrow_book)
{
    ui->setupUi(this);
}

borrow_book::~borrow_book()
{
    delete ui;
}

void borrow_book::on_borrow_clicked()
{
    extern QString user_name;
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call insert_borrow('%1','%2','%3',curdate(),@result)").arg
            (ui->reader_name->text(),ui->book_num->text(), user_name);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "办理借阅sql执行出错");
        return;
    }
    while(sqlQuery.next())
    {
        if(sqlQuery.value(0).toString() != "成功")
        {
            QMessageBox::information(this, "infor", sqlQuery.value(0).toString());
            return;
        }
    }
    QMessageBox::information(this, "infor", "办理成功");
    sqlQuery.finish();
    extern borrow_book *bb;
    bb->hide();
    delete bb;
    bb = nullptr;
}
