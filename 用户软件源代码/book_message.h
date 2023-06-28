#ifndef BOOK_MESSAGE_H
#define BOOK_MESSAGE_H

#include <QWidget>

namespace Ui {
class book_message;
}

class book_message : public QWidget
{
    Q_OBJECT

public:
    explicit book_message(QWidget *parent = nullptr);
    ~book_message();

private slots:
    void on_query_clicked();

private:
    Ui::book_message *ui;
};

#endif // BOOK_MESSAGE_H
