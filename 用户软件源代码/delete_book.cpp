#include "delete_book.h"
#include "ui_delete_book.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>

extern delete_book *db;

delete_book::delete_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::delete_book)
{
    ui->setupUi(this);
}

delete_book::~delete_book()
{
    delete ui;
}

void delete_book::on_confirm_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call delete_book('%1',@result)").arg(ui->book_num->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行删除失败");
        sqlQuery.finish();
        return;
    }

    while(sqlQuery.next())
    {
        if(sqlQuery.value(0).toString() == "图书不存在")
        {
            QMessageBox::information(this, "infor", "图书不存在");
            sqlQuery.finish();
            return;
        }
        QMessageBox::information(this, "infor",sqlQuery.value(0).toString() );
    }

    sqlQuery.finish();
    db->hide();
    delete db;
    db = nullptr;
}
