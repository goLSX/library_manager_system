#include "opinion_result.h"
#include "ui_opinion_result.h"
#include "qmylabel.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
opinion_result::opinion_result(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::opinion_result)
{
    ui->setupUi(this);
    connect(ui->tableWidget,&QTableWidget::itemClicked,ui->mylabel,&qmylabel::rsetText);
    ui->tableWidget->setHorizontalHeaderLabels(QStringList() << "意见记录编号" << "读者用户名" << "读者意见" << "提交时间" <<
                             "处理状态" <<  "处理结果" <<  "处理人用户名" << "处理完成时间" );

    ui->tableWidget->horizontalHeader()->setStyleSheet
            ("QHeaderView::section{font-weight: bold; font-size: 25px; height: 50px;background:lightblue;}"); //skyblue设置表头风格


    //调整宽度
    ui->tableWidget->setColumnWidth(0, 180);   //意见记录编号
    ui->tableWidget->setColumnWidth(1, 200);  //读者用户名
    ui->tableWidget->setColumnWidth(2, 450);  //读者意见
    ui->tableWidget->setColumnWidth(3, 150);  //提交时间
    ui->tableWidget->setColumnWidth(4, 150);  //处理状态
    ui->tableWidget->setColumnWidth(5, 450);  //处理结果
    ui->tableWidget->setColumnWidth(6, 180);  //处理人用户名
    ui->tableWidget->setColumnWidth(7, 180);  //处理完成时间

    extern QString user_name;
    QSqlQuery sqlQuery(QSqlDatabase::database("reader_connection")); // 指定使用reader连接
    QString sql;
    sql = QObject::tr(" call select_opinion_result_message('%1')").arg(user_name);
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "执行出错");
        return;
    }
    for(int i = 0; sqlQuery.next();i++)
    {
        for(int j = 0; j < 8 ;j++)
        {
            ui->tableWidget->setItem(i,j,new QTableWidgetItem(sqlQuery.value(j).toString()));
        }
    }
    sqlQuery.finish();

}

opinion_result::~opinion_result()
{
    delete ui;
    extern opinion_result *o;
    delete o;
    o = nullptr;
}
