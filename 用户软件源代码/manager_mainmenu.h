#ifndef MANAGER_MAINMENU_H
#define MANAGER_MAINMENU_H

#include <QWidget>

namespace Ui {
class manager_mainmenu;
}

class manager_mainmenu : public QWidget
{
    Q_OBJECT

public:
    explicit manager_mainmenu(QWidget *parent = nullptr);
    ~manager_mainmenu();

private slots:
    void on_logout_clicked();

    void on_change_password_clicked();

    void on_query_book_clicked();

    void on_query_manager_clicked();

    void on_query_borrow_clicked();

    void on_delete_book_clicked();

    void on_insert_book_clicked();

    void on_update_book_clicked();

    void on_borrow_book_clicked();

    void on_return_book_clicked();

    void on_selete_opinion_clicked();

    void on_extend_time_clicked();

private:
    Ui::manager_mainmenu *ui;
};

#endif // MANAGER_MAINMENU_H
