#ifndef INSERT_OPINION_H
#define INSERT_OPINION_H

#include <QWidget>

namespace Ui {
class insert_opinion;
}

class insert_opinion : public QWidget
{
    Q_OBJECT

public:
    explicit insert_opinion(QWidget *parent = nullptr);
    ~insert_opinion();

private slots:
    void on_submit_clicked();

private:
    Ui::insert_opinion *ui;
};

#endif // INSERT_OPINION_H
