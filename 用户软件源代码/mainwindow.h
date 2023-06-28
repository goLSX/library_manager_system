#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:


    void on_sigh_up_button_clicked();

    void on_sigh_in_button_clicked();

private:
    Ui::MainWindow *ui;
};


bool build_checker();
bool build_reader();
bool build_manager();
#endif // MAINWINDOW_H
