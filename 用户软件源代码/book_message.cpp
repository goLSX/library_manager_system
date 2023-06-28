#include "book_message.h"
#include "ui_book_message.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
book_message::book_message(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::book_message)
{
    ui->setupUi(this);
    ui->tableWidget->setHorizontalHeaderLabels(QStringList() << "图书编号" << "图书名" << "价格" << "状态" << "位置"  );
    ui->tableWidget->horizontalHeader()->setStyleSheet
        ("QHeaderView::section{font-weight: bold; font-size: 40px; height: 60px;background:lightblue;}"); //设置表头风格


    ui->tableWidget->setColumnWidth(0, 200);   //设置每一列宽度
    ui->tableWidget->setColumnWidth(1, 500);
    ui->tableWidget->setColumnWidth(2, 200);
    ui->tableWidget->setColumnWidth(3, 200);
    ui->tableWidget->setColumnWidth(4, 440);

}

book_message::~book_message()
{
    delete ui;
    extern book_message *b;
    delete b;
    b = nullptr;
}

void book_message::on_query_clicked()
{
    extern QString user_type;
    ui->tableWidget->clearContents();   //清除表格内容
    QString connection_name;
    if(user_type == "读者")  connection_name = "reader_connection";
    else if(user_type == "图书管理员")  connection_name = "manager_connection";
    QSqlQuery sqlQuery(QSqlDatabase::database(connection_name)); // 指定使用哪个连接
    QString sql;
    sql = QObject::tr(" call select_book_message('%1')").arg(ui->book_name->text());    //从输入框获取书名进行sql查询
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错");
        return;
    }
    QMessageBox::information(this, "infor", "图书信息查询sql执行成功\n查到" + QString::number(sqlQuery.size()) + "条数据" );
    for(int i = 0; sqlQuery.next();i++)
    {
        for(int j = 0; j < 5 ;j++)          // 循环设置每一列的内容，共5列
        {
            ui->tableWidget->setItem(i,j,new QTableWidgetItem(sqlQuery.value(j).toString()));
        }
    }
    sqlQuery.finish();
}
