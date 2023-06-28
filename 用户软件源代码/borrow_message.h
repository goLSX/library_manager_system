#ifndef BORROW_MESSAGE_H
#define BORROW_MESSAGE_H

#include <QWidget>

namespace Ui {
class borrow_message;
}

class borrow_message : public QWidget
{
    Q_OBJECT

public:
    explicit borrow_message(QWidget *parent = nullptr);
    ~borrow_message();

private slots:
    void on_query_clicked();

private:
    Ui::borrow_message *ui;
};

#endif // BORROW_MESSAGE_H
