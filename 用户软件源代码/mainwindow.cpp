#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "sigh_up.h"
#include "reader_mainmenu.h"
#include "manager_mainmenu.h"
#include "sysmanager_mainmenu.h"
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

#include <QMessageBox>
#include <QDebug>
#include <QCryptographicHash>     //md5头文件

extern MainWindow *w;
extern sigh_up *s;
extern reader_mainmenu *rm;
extern manager_mainmenu *mm;
extern sysmanager_mainmenu *smm;


extern QString user_type;
extern QString user_name;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

}

MainWindow::~MainWindow()
{
    delete ui;
}

bool build_checker()
{
    //建立checker连接
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL","checker_connection");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setUserName("checker");
    db.setPassword("checkerpassword");
    db.setDatabaseName("library_db");//数据库名
    return db.open();
}
bool build_reader()
{
    //建立reader连接
    QSqlDatabase reader_db = QSqlDatabase::addDatabase("QMYSQL","reader_connection");
    reader_db.setHostName("127.0.0.1");
    reader_db.setPort(3306);
    reader_db.setUserName("reader");
    reader_db.setPassword("readerpassword");
    reader_db.setDatabaseName("library_db");//数据库名
    return reader_db.open();
}
bool build_manager()
{
    //建立manager连接
    QSqlDatabase manager_db = QSqlDatabase::addDatabase("QMYSQL","manager_connection");
    manager_db.setHostName("127.0.0.1");
    manager_db.setPort(3306);
    manager_db.setUserName("manager");
    manager_db.setPassword("managerpassword");
    manager_db.setDatabaseName("library_db");//数据库名
    return manager_db.open();
}



void MainWindow::on_sigh_up_button_clicked()
{
   s = new sigh_up;
   s->show();
}

void MainWindow::on_sigh_in_button_clicked()
{
    user_type = ui->comboBox->currentText();     //用户选择的登录类型
    user_name = ui->user_name->text();           //用户名
    QString password = ui->password->text();     //密码

    if(user_type == "读者")
    {

        QSqlQuery sqlQuery(QSqlDatabase::database("checker_connection")); // 指定使用checker连接
        QString sql;
        password = QCryptographicHash::hash(password.toLatin1(),QCryptographicHash::Md5).toHex();   //求md5
        sql = QObject::tr(" call check_reader('%1','%2',@result)").arg(user_name,password);

        qDebug() << "用户正确 " << sqlQuery.exec(sql) << endl;   //检查用户信息是否正确


        while(sqlQuery.next())
        {
             if(sqlQuery.value(0).toString() != "正确")     // sql检验用户不正确
             {
                 QMessageBox::information(this, "infor", user_type+"用户名或密码错误");
                 return;
             }
        }
        sqlQuery.finish();
        QSqlDatabase::database("checker_connection").close();     //关闭checker连接
        QSqlDatabase::removeDatabase("checker_connection");  //从列表删除

        if(!build_reader())      //建立reader连接
        {
            QMessageBox::information(this, "infor", "reader连接失败");
            exit(1);
        }

        rm = new reader_mainmenu;   //创建读者菜单
        w->hide();
        delete w;      //删除登录界面
        w = nullptr;
        rm->show();    //显示读者菜单
    }
    else if(user_type == "图书管理员")
    {

        QSqlQuery sqlQuery(QSqlDatabase::database("checker_connection")); // 指定使用checker_db连接
        QString sql;
        password = QCryptographicHash::hash(password.toLatin1(),QCryptographicHash::Md5).toHex();   //求md5
        sql = QObject::tr(" call check_manager('%1','%2',@result)").arg(user_name,password);

        qDebug() << "用户正确 " << sqlQuery.exec(sql) << endl;   //检查用户信息是否正确
        qDebug() << "结果size " << sqlQuery.size() << endl;

        while(sqlQuery.next())
        {
             if(sqlQuery.value(0).toString() != "正确")     // sql检验用户不正确
             {
                 if(sqlQuery.value(0).toString() == "注销") QMessageBox::information(this, "infor", "账户已注销");
                 else QMessageBox::information(this, "infor", user_type+"用户名或密码错误");
                 return;
             }
        }
        sqlQuery.finish();
        QSqlDatabase::database("checker_connection").close();     //关闭checker连接
        QSqlDatabase::removeDatabase("checker_connection");  //从列表删除


        if(!build_manager())      //建立manager连接
        {
            QMessageBox::information(this, "infor", "manager连接失败");
            exit(1);
        }

        mm = new manager_mainmenu;   //创建图书管理员菜单
        w->hide();
        delete w;      //删除登录界面
        w = nullptr;
        mm->show();    //显示图书管理员菜单
    }
    else if(user_type == "系统管理员")     //使用输入的用户名和密码尝试建立mysql连接,没有检查阶段，因为不存储系统管理员账户
    {
        //建立sysmanager连接
        QSqlDatabase sysmanager_db = QSqlDatabase::addDatabase("QMYSQL","sysmanager_connection");
        sysmanager_db.setHostName("127.0.0.1");
        sysmanager_db.setPort(3306);
        sysmanager_db.setUserName(user_name);             //这里使用的账户密码是 mysql创建的用户的账户密码
        sysmanager_db.setPassword(password);
        sysmanager_db.setDatabaseName("library_db");//数据库名
        if(!sysmanager_db.open())    //sysmanager连接失败
        {
           QMessageBox::information(this, "infor","登录数据库账户有误!\n sysmanager连接数据库失败 ");
           return;
        }
        smm = new sysmanager_mainmenu;   //创建系统管理员菜单
        w->hide();
        delete w;      //删除登录界面
        w = nullptr;
        smm->show();    //显示系统管理员菜单
    }
}
