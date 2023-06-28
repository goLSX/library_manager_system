#ifndef BORROW_BOOK_H
#define BORROW_BOOK_H

#include <QWidget>

namespace Ui {
class borrow_book;
}

class borrow_book : public QWidget
{
    Q_OBJECT

public:
    explicit borrow_book(QWidget *parent = nullptr);
    ~borrow_book();

private slots:
    void on_borrow_clicked();

private:
    Ui::borrow_book *ui;
};

#endif // BORROW_BOOK_H
