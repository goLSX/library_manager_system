#include "mainwindow.h"
#include "sigh_up.h"
#include "reader_mainmenu.h"
#include "manager_mainmenu.h"
#include "sysmanager_mainmenu.h"

#include<QMessageBox>

#include <QApplication>

MainWindow *w=nullptr;              //登录页指针
sigh_up *s=nullptr;                 //注册页指针
reader_mainmenu *rm=nullptr;        //读者菜单指针
manager_mainmenu *mm=nullptr;       //图书管理员菜单指针
sysmanager_mainmenu *smm=nullptr;   //系统管理员菜单指针

QString user_type;       //登录的用户类型
QString user_name;       //登录的用户名





int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    w = new MainWindow;

    if(!build_checker())    //建立checker失败
    {
        QMessageBox::information(w,"infor" ,"checker连接建立失败");
        exit(1);   //退出程序
    }
    w->show();   //显示登录页

    return a.exec();
}
