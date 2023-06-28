#ifndef EXTEND_TIME_H
#define EXTEND_TIME_H

#include <QWidget>

namespace Ui {
class extend_time;
}

class extend_time : public QWidget
{
    Q_OBJECT

public:
    explicit extend_time(QWidget *parent = nullptr);
    ~extend_time();

private slots:
    void on_choose_clicked();

    void on_extend_clicked();

private:
    Ui::extend_time *ui;
};

#endif // EXTEND_TIME_H
