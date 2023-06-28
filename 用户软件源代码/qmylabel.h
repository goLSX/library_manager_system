#ifndef QMYLABEL_H
#define QMYLABEL_H

#include <QObject>
#include <QTableWidgetItem>
#include <QLabel>
class qmylabel : public QLabel
{
    Q_OBJECT
public:
    explicit qmylabel(QWidget *parent = nullptr);

signals:

public slots:
    void rsetText(QTableWidgetItem * item);
};

#endif // QMYLABEL_H
