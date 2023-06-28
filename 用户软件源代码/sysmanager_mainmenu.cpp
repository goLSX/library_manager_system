#include "sysmanager_mainmenu.h"
#include "ui_sysmanager_mainmenu.h"
#include "mainwindow.h"
#include "manager_sigh_up.h"
#include "delete_manager.h"
#include "manager_message.h"


#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>


extern sysmanager_mainmenu *smm;
extern MainWindow *w;

manager_sigh_up *m;
delete_manager *dm;
manager_message *mme;

sysmanager_mainmenu::sysmanager_mainmenu(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::sysmanager_mainmenu)
{
    ui->setupUi(this);
    extern QString user_name;
    ui->user_name->setText("用户名: " + user_name);
}

sysmanager_mainmenu::~sysmanager_mainmenu()
{
    delete ui;
}

void sysmanager_mainmenu::on_logout_button_clicked()
{
    w = new MainWindow;   //重建登录菜单
    smm->hide();
    w->show();
    delete smm;            //删除系统管理员菜单
    smm = nullptr;
//    if(!build_checker())    //建立checker失败
//    {
//        exit(1);   //退出程序
//    }
    QSqlDatabase::database("sys_manager_connection").close();
    QSqlDatabase::removeDatabase("sys_manager_connection");       //关闭sys_manager连接
}

void sysmanager_mainmenu::on_insert_manager_clicked()
{
    m = new manager_sigh_up;
    m->show();
}

void sysmanager_mainmenu::on_delete_manager_clicked()
{
   dm = new delete_manager;
   dm->show();
}

void sysmanager_mainmenu::on_query_manager_clicked()
{
    mme =  new manager_message;
    mme->show();
}
