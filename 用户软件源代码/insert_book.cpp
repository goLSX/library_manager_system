#include "insert_book.h"
#include "ui_insert_book.h"
#include <QRegExpValidator>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>

insert_book::insert_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::insert_book)
{
    ui->setupUi(this);
    QRegExp exp("[0-9\\.]+$");
    QValidator *Validator = new QRegExpValidator(exp);
    ui->book_price->setValidator(Validator);
}

insert_book::~insert_book()
{
    delete ui;
}

void insert_book::on_insert_clicked()
{

    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    if(ui->book_position->text() == "")
    {
        sql = QObject::tr(" call insert_book('%1','%2',null)").arg
                (ui->book_name->text(),ui->book_price->text());
    }
    else
    {
        sql = QObject::tr(" call insert_book('%1','%2','%3')").arg
            (ui->book_name->text(),ui->book_price->text(),ui->book_position->text());
    }
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错,可能价格有误");
        return;
    }
    QMessageBox::information(this, "infor", "添加成功");
    sqlQuery.finish();
    extern insert_book *ib;
    ib->hide();
    delete ib;
    ib = nullptr;
}
