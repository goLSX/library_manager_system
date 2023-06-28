#include "give_feedback.h"
#include "ui_give_feedback.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QMessageBox>
#include <QDebug>
give_feedback::give_feedback(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::give_feedback)
{
    ui->setupUi(this);
    ui->tableWidget->setHorizontalHeaderLabels(QStringList() << "意见编号" << "提交用户名" << "意见" << "提交时间" );
    ui->tableWidget->horizontalHeader()->setStyleSheet("QHeaderView::section{font-weight: bold; font-size: 40px; height: 60px;background:lightblue;}"); //skyblue设置表头风格
    ui->tableWidget->setColumnWidth(0, 200);   //设置每一列宽度
    ui->tableWidget->setColumnWidth(1, 230);
    ui->tableWidget->setColumnWidth(2, 750);
    ui->tableWidget->setColumnWidth(3, 250);

    ui->confirm->hide();

    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call select_pending_opinion()");
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "意见信息查询sql执行出错");
        return;
    }
    if(!sqlQuery.size())         //没有待处理反馈
    {
        QMessageBox::information(this, "infor", "没有待处理反馈");
        return;
    }
    QMessageBox::information(this, "infor", "查询到"+QString::number(sqlQuery.size())+"条待处理反馈");
    for(int i = 0; sqlQuery.next();i++)
    {
        for(int j = 0; j < 4 ;j++)
        {
            ui->tableWidget->setItem(i,j,new QTableWidgetItem(sqlQuery.value(j).toString()));
        }
    }
    sqlQuery.finish();

}

give_feedback::~give_feedback()
{
    delete ui;
}

void give_feedback::on_deal_clicked()
{
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    sql = QObject::tr(" call select_opinion('%1')").arg(ui->opinion_rec_num->text());
    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "意见信息查询sql执行出错");
        return;
    }
    if(!sqlQuery.size())
    {
        QMessageBox::information(this, "infor", "意见不存在");
        return;
    }
    while(sqlQuery.next())
    {
        if(sqlQuery.value(1).toString() == "处理完成")
        {
            QMessageBox::information(this, "infor", "该意见已处理完成,不用处理");
            return;
        }
        ui->user_opinion->setText(sqlQuery.value(0).toString());
    }
    sqlQuery.finish();
    ui->deal->hide();
    ui->opinion_rec_num->hide();
    ui->confirm->show();

}

void give_feedback::on_confirm_clicked()
{
    if(ui->result->toPlainText().size() > 100)
    {
        QMessageBox::information(this, "infor", "太长了,不能超过100字");
        return;
    }
    QSqlQuery sqlQuery(QSqlDatabase::database("manager_connection")); // 指定使用manager连接
    QString sql;
    extern QString user_name;
    sql = QObject::tr(" call insert_opinion_result('%1','%2','%3',curdate())").arg
            (ui->opinion_rec_num->text(),ui->result->toPlainText(),user_name);

    if(!sqlQuery.exec(sql))
    {
        QMessageBox::information(this, "infor", "提交处理结果sql执行出错");
        return;
    }
    QMessageBox::information(this, "infor", "提交成功");
    sqlQuery.finish();
    extern give_feedback *gf;
    gf->hide();
    delete  gf;
    gf = nullptr;
}
