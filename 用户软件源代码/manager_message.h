#ifndef MANAGER_MESSAGE_H
#define MANAGER_MESSAGE_H

#include <QWidget>

namespace Ui {
class manager_message;
}

class manager_message : public QWidget
{
    Q_OBJECT

public:
    explicit manager_message(QWidget *parent = nullptr);
    ~manager_message();

private slots:
    void on_query_clicked();

    void on_change_clicked();

    void on_confirm_clicked();

    void on_manager_change_clicked();

    void on_manager_confirm_clicked();

private:
    Ui::manager_message *ui;
};

#endif // MANAGER_MESSAGE_H
