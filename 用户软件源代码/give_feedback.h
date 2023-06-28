#ifndef GIVE_FEEDBACK_H
#define GIVE_FEEDBACK_H

#include <QWidget>

namespace Ui {
class give_feedback;
}

class give_feedback : public QWidget
{
    Q_OBJECT

public:
    explicit give_feedback(QWidget *parent = nullptr);
    ~give_feedback();

private slots:
    void on_deal_clicked();

    void on_confirm_clicked();

private:
    Ui::give_feedback *ui;
};

#endif // GIVE_FEEDBACK_H
