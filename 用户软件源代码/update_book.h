#ifndef UPDATE_BOOK_H
#define UPDATE_BOOK_H

#include <QWidget>

namespace Ui {
class update_book;
}

class update_book : public QWidget
{
    Q_OBJECT

public:
    explicit update_book(QWidget *parent = nullptr);
    ~update_book();

private slots:
    void on_choose_clicked();

    void on_change_clicked();

    void on_confirm_clicked();

private:
    Ui::update_book *ui;
};

#endif // UPDATE_BOOK_H
