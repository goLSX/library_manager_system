#include "mainwindow.h"
#include "manager_mainmenu.h"
#include "ui_manager_mainmenu.h"
#include "change_password.h"
#include "book_message.h"
#include "manager_message.h"
#include "borrow_message.h"
#include "delete_book.h"
#include "insert_book.h"
#include "update_book.h"
#include "borrow_book.h"
#include "return_book.h"
#include "give_feedback.h"
#include "extend_time.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

extern manager_mainmenu *mm;
extern MainWindow *w;
extern QString user_name;

extern manager_message *mme;
extern book_message *b;
extern borrow_message *bm;

delete_book *db;
insert_book *ib;
update_book *ub;
borrow_book *bb;
return_book *rb;
give_feedback *gf;
extend_time *et;

manager_mainmenu::manager_mainmenu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::manager_mainmenu)
{
    ui->setupUi(this);
    ui->manager_name->setText(user_name);
}

manager_mainmenu::~manager_mainmenu()
{
    delete ui;
}

void manager_mainmenu::on_logout_clicked()
{
    w = new MainWindow;   //重建登录菜单
    mm->hide();
    w->show();
    delete mm;            //删除图书管理员菜单
    mm = nullptr;
    if(!build_checker())    //建立checker失败
    {
        exit(1);   //退出程序
    }
    QSqlDatabase::database("manager_connection").close();
    QSqlDatabase::removeDatabase("manager_connection");       //关闭manager连接
}

void manager_mainmenu::on_change_password_clicked()
{
   extern change_password *c;
   c = new change_password;
   c->show();
}

void manager_mainmenu::on_query_book_clicked()
{
    b = new book_message;
    b->show();
}

void manager_mainmenu::on_query_manager_clicked()
{
    mme = new manager_message;
    mme->show();
}

void manager_mainmenu::on_query_borrow_clicked()
{
    bm = new borrow_message;
    bm->show();
}

void manager_mainmenu::on_delete_book_clicked()
{
    db = new delete_book;
    db->show();
}

void manager_mainmenu::on_insert_book_clicked()
{
    ib = new insert_book;
    ib->show();
}

void manager_mainmenu::on_update_book_clicked()
{
    ub = new update_book;
    ub->show();
}

void manager_mainmenu::on_borrow_book_clicked()
{
    bb = new borrow_book;
    bb->show();
}

void manager_mainmenu::on_return_book_clicked()
{
    rb = new return_book;
    rb->show();
}

void manager_mainmenu::on_selete_opinion_clicked()
{
    gf = new give_feedback;
    gf->show();
}

void manager_mainmenu::on_extend_time_clicked()
{
    et = new extend_time;
    et->show();
}
