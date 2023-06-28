#include "borrow_message.h"
#include "ui_borrow_message.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
extern QString user_type;
borrow_message::borrow_message(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::borrow_message)
{
    ui->setupUi(this);
    ui->tableWidget->setHorizontalHeaderLabels(QStringList() << "借阅编号" << "读者用户名" << "图书编号" << "图书名" << "借阅时间" <<
                            "借阅办理人用户名" << "借阅状态" <<  "归还时间" << "借阅期限" << "归还办理人用户名" << "费用" << "归还类型");

    ui->tableWidget->horizontalHeader()->setStyleSheet
            ("QHeaderView::section{font-weight: bold; font-size: 25px; height: 50px;background:lightblue;}"); //skyblue设置表头风格


    ui->tableWidget->setColumnWidth(0, 160);   //借阅编号
    ui->tableWidget->setColumnWidth(1, 230);  //读者用户名
    ui->tableWidget->setColumnWidth(2, 160);  //图书编号
    ui->tableWidget->setColumnWidth(3, 300);  //图书名
    ui->tableWidget->setColumnWidth(4, 200);  //借阅时间
    ui->tableWidget->setColumnWidth(5, 250);  //借阅办理人用户名
    ui->tableWidget->setColumnWidth(6, 130);  //借阅状态
    ui->tableWidget->setColumnWidth(7, 200);  //归还时间
    ui->tableWidget->setColumnWidth(8, 130);  //借阅期限
    ui->tableWidget->setColumnWidth(9, 250);  //归还办理人用户名
    ui->tableWidget->setColumnWidth(10,150);   //费用
    ui->tableWidget->setColumnWidth(11,200); //归还类型

    if(user_type == "读者")
    {
        ui->widget->hide();
        extern QString user_name;
        QSqlQuery sqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接
        QString sql;
        sql = QObject::tr(" call select_return_message('%1')").arg(user_name);
        if(!sqlQuery.exec(sql))
        {
            QMessageBox::information(this, "infor", "借阅信息查询sql执行出错");
            return;
        }
        for(int i = 0; sqlQuery.next();i++)
        {
            for(int j = 0; j < 12 ;j++)
            {
                ui->tableWidget->setItem(i,j,new QTableWidgetItem(sqlQuery.value(j).toString()));
            }
        }
        sqlQuery.finish();
    }

}

borrow_message::~borrow_message()
{
    delete ui;
}

void borrow_message::on_query_clicked()
{
    ui->tableWidget->clearContents();   //清除表格内容
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call select_return_message('%1')").arg(ui->reader_name->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "借阅信息查询sql执行出错");
        return;
    }

    QMessageBox::information(this, "infor", "借阅信息查询sql执行成功\n查到" + QString::number(sqlQuery.size()) + "条数据" );
    for(int i = 0; sqlQuery.next();i++)
    {
        for(int j = 0; j < 12 ;j++)
        {
            ui->tableWidget->setItem(i,j,new QTableWidgetItem(sqlQuery.value(j).toString()));
        }
    }
    sqlQuery.finish();
}
