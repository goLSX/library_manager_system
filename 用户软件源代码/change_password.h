#ifndef CHANGE_PASSWORD_H
#define CHANGE_PASSWORD_H

#include <QWidget>

namespace Ui {
class change_password;
}

class change_password : public QWidget
{
    Q_OBJECT

public:
    explicit change_password(QWidget *parent = nullptr);
    ~change_password();

private slots:
    void on_confirm_clicked();

private:
    Ui::change_password *ui;
};

#endif // CHANGE_PASSWORD_H
