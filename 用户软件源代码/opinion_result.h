#ifndef OPINION_RESULT_H
#define OPINION_RESULT_H
#include "qmylabel.h"
#include <QWidget>

namespace Ui {
class opinion_result;
}

class opinion_result : public QWidget
{
    Q_OBJECT

public:
    explicit opinion_result(QWidget *parent = nullptr);
    ~opinion_result();

private:
    Ui::opinion_result *ui;
};

#endif // OPINION_RESULT_H
