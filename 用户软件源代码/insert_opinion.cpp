#include "insert_opinion.h"
#include "ui_insert_opinion.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
insert_opinion::insert_opinion(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::insert_opinion)
{
    ui->setupUi(this);
}

insert_opinion::~insert_opinion()
{
    delete ui;
}

void insert_opinion::on_submit_clicked()
{
    QString opinion = ui->opinion->toPlainText();
    if(opinion.size() > 100)
    {
        QMessageBox::information(this, "infor", "太长了，请不要超过100字");
        return;
    }
    QSqlQuery sqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接
    QString sql;
    extern QString user_name;
    sql = QObject::tr(" call insert_opinion('%1','%2',curdate())").arg(user_name,opinion);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错");
        return;
    }
    QMessageBox::information(this, "infor", "提交成功");
    extern insert_opinion *i;
    i->hide();
    delete i;
    i = nullptr;
}
