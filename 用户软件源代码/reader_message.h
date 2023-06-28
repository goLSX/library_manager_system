#ifndef READER_MESSAGE_H
#define READER_MESSAGE_H

#include <QWidget>

namespace Ui {
class reader_message;
}

class reader_message : public QWidget
{
    Q_OBJECT

public:
    explicit reader_message(QWidget *parent = nullptr);
    ~reader_message();

private slots:
    void on_change_clicked();

    void on_confirm_clicked();

private:
    Ui::reader_message *ui;
};


#endif // READER_MESSAGE_H
