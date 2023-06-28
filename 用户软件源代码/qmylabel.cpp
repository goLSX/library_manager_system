#include "qmylabel.h"

qmylabel::qmylabel(QWidget *parent) : QLabel(parent)
{

}
void qmylabel::rsetText(QTableWidgetItem * item){

    this->setText(item->text());
}
