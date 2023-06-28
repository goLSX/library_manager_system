#include "update_book.h"
#include "ui_update_book.h"
#include <QRegExpValidator>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
extern QString user_type;
update_book::update_book(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::update_book)
{
    ui->setupUi(this);
    ui->change->hide();
    ui->confirm->hide();
    QRegExp exp("[0-9\\.]+$");
    QValidator *Validator = new QRegExpValidator(exp);
    ui->book_price->setValidator(Validator);
}

update_book::~update_book()
{
    delete ui;
}

void update_book::on_choose_clicked()
{

    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call select_book_by_num('%1')").arg(ui->book_num->text());    //从输入框获取书籍编号进行sql查询
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "查询书籍sql执行出错");
        return;
    }
    if(!sqlQuery.size())
    {
        QMessageBox::information(this, "infor", "查无此书" );
        return;
    }
    while (sqlQuery.next())
    {
        ui->book_num_display->setText(sqlQuery.value(0).toString());
        ui->book_name->setText(sqlQuery.value(1).toString());
        ui->book_price->setText(sqlQuery.value(2).toString());
        ui->book_state->setText(sqlQuery.value(3).toString());
        ui->book_position->setText(sqlQuery.value(4).toString());
    }
    sqlQuery.finish();
    ui->change->show();
}

void update_book::on_change_clicked()
{
    ui->choose->hide();
    ui->confirm->show();
    ui->change->hide();
    ui->book_num->hide();

    ui->book_name->setStyleSheet("");
    ui->book_name->setReadOnly(false);
    ui->book_price->setStyleSheet("");
    ui->book_price->setReadOnly(false);
    ui->book_state->setStyleSheet("");
    ui->book_state->setReadOnly(false);
    ui->book_position->setStyleSheet("");
    ui->book_position->setReadOnly(false);
}

void update_book::on_confirm_clicked()
{
    if(ui->book_state->text() != "不可借" && ui->book_state->text() != "可借")
    {
        QMessageBox::information(this, "infor", "书籍状态有误\n可借/不可借");
        return;
    }
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call update_book('%1','%2','%3','%4','%5')").arg(ui->book_num_display->text(),
          ui->book_name->text(),ui->book_price->text(),ui->book_state->text(),ui->book_position->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "修改图书信息sql执行出错,可能价格有误");
        return;
    }
    QMessageBox::information(this, "infor", "修改成功");
    sqlQuery.finish();

    extern update_book *ub;
    ub->hide();
    delete ub;
    ub = nullptr;
}
