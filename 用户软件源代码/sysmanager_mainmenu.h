#ifndef SYSMANAGER_MAINMENU_H
#define SYSMANAGER_MAINMENU_H

#include <QWidget>

namespace Ui {
class sysmanager_mainmenu;
}

class sysmanager_mainmenu : public QWidget
{
    Q_OBJECT

public:
    explicit sysmanager_mainmenu(QWidget *parent = nullptr);
    ~sysmanager_mainmenu();

private slots:
    void on_logout_button_clicked();

    void on_insert_manager_clicked();

    void on_delete_manager_clicked();

    void on_query_manager_clicked();

private:
    Ui::sysmanager_mainmenu *ui;
};

#endif // SYSMANAGER_MAINMENU_H
