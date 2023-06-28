#ifndef READER_MAINMENU_H
#define READER_MAINMENU_H

#include <QWidget>

namespace Ui {
class reader_mainmenu;
}

class reader_mainmenu : public QWidget
{
    Q_OBJECT

public:
    explicit reader_mainmenu(QWidget *parent = nullptr);
    ~reader_mainmenu();

private slots:
    void on_logout_button_clicked();

    void on_query_reader_clicked();

    void on_query_book_clicked();

    void on_borrow_message_clicked();

    void on_submit_opinion_clicked();

    void on_query_opinion_result_clicked();

    void on_change_password_clicked();

private:
    Ui::reader_mainmenu *ui;
};

#endif // READER_MAINMENU_H
