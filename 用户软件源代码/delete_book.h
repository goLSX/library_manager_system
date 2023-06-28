#ifndef DELETE_BOOK_H
#define DELETE_BOOK_H

#include <QWidget>

namespace Ui {
class delete_book;
}

class delete_book : public QWidget
{
    Q_OBJECT

public:
    explicit delete_book(QWidget *parent = nullptr);
    ~delete_book();

private slots:
    void on_confirm_clicked();

private:
    Ui::delete_book *ui;
};

#endif // DELETE_BOOK_H
