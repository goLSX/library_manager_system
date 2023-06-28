#ifndef DELETE_MANAGER_H
#define DELETE_MANAGER_H

#include <QWidget>

namespace Ui {
class delete_manager;
}

class delete_manager : public QWidget
{
    Q_OBJECT

public:
    explicit delete_manager(QWidget *parent = nullptr);
    ~delete_manager();

private slots:
    void on_confirm_clicked();

private:
    Ui::delete_manager *ui;
};

#endif // DELETE_MANAGER_H
