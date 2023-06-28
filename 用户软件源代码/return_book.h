#ifndef RETURN_BOOK_H
#define RETURN_BOOK_H

#include <QWidget>

namespace Ui {
class return_book;
}

class return_book : public QWidget
{
    Q_OBJECT

public:
    explicit return_book(QWidget *parent = nullptr);
    ~return_book();

private slots:
    void on_choose_clicked();

    void on_return_button_clicked();

    void on_return_button_bad_clicked();

private:
    Ui::return_book *ui;
};

#endif // RETURN_BOOK_H
