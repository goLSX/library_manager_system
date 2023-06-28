#ifndef INSERT_BOOK_H
#define INSERT_BOOK_H

#include <QWidget>

namespace Ui {
class insert_book;
}

class insert_book : public QWidget
{
    Q_OBJECT

public:
    explicit insert_book(QWidget *parent = nullptr);
    ~insert_book();

private slots:
    void on_insert_clicked();

private:
    Ui::insert_book *ui;
};

#endif // INSERT_BOOK_H
