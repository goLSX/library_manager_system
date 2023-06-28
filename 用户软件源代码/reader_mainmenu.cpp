#include "mainwindow.h"
#include "reader_message.h"
#include "book_message.h"
#include "borrow_message.h"
#include "insert_opinion.h"
#include "opinion_result.h"
#include "change_password.h"



#include "reader_mainmenu.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include "ui_reader_mainmenu.h"

extern QString user_name;
extern reader_mainmenu *rm;
extern MainWindow *w;

reader_message *r;
book_message *b;
borrow_message *bm;
insert_opinion *i;
opinion_result *o;
change_password *c;


reader_mainmenu::reader_mainmenu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::reader_mainmenu)
{
    ui->setupUi(this);
    ui->user_name->setText(user_name);
}

reader_mainmenu::~reader_mainmenu()
{
    delete ui;
}

void reader_mainmenu::on_logout_button_clicked()    //退出登录
{
   w = new MainWindow;   //重建登录菜单
   rm->hide();
   w->show();
   delete rm;            //删除读者菜单
   rm = nullptr;
   if(!build_checker())    //建立checker失败
   {
       exit(1);   //退出程序
   }
   QSqlDatabase::database("reader_connection").close();
   QSqlDatabase::removeDatabase("reader_connection");       //关闭reader连接
}

void reader_mainmenu::on_query_reader_clicked()
{
   r = new reader_message;   //创建读者信息页

   //this->hide();

   r->show();    //显示读者信息页
}

void reader_mainmenu::on_query_book_clicked()
{
   b = new book_message;
   b->show();

}

void reader_mainmenu::on_borrow_message_clicked()
{
    bm = new borrow_message;
    bm->show();
}

void reader_mainmenu::on_submit_opinion_clicked()
{
   i = new insert_opinion;
   i->show();
}

void reader_mainmenu::on_query_opinion_result_clicked()
{
   o = new opinion_result;
   o->show();
}

void reader_mainmenu::on_change_password_clicked()
{
    c = new change_password;
    c->show();
}
