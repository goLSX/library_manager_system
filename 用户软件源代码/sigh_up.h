#ifndef SIGH_UP_H
#define SIGH_UP_H

#include <QWidget>
#include <QValidator>
namespace Ui {
class sigh_up;
}

class sigh_up : public QWidget
{
    Q_OBJECT

public:
    explicit sigh_up(QWidget *parent = nullptr);
    ~sigh_up();

private slots:
    void on_sigh_up_confirm_clicked();

private:
    Ui::sigh_up *ui;
};

#endif // SIGH_UP_H
