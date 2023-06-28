#ifndef MANAGER_SIGH_UP_H
#define MANAGER_SIGH_UP_H

#include <QWidget>

namespace Ui {
class manager_sigh_up;
}

class manager_sigh_up : public QWidget
{
    Q_OBJECT

public:
    explicit manager_sigh_up(QWidget *parent = nullptr);
    ~manager_sigh_up();

private slots:
    void on_confirm_clicked();

private:
    Ui::manager_sigh_up *ui;
};

#endif // MANAGER_SIGH_UP_H
