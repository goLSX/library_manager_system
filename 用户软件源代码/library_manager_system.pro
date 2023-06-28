QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    book_message.cpp \
    borrow_book.cpp \
    borrow_message.cpp \
    change_password.cpp \
    delete_book.cpp \
    delete_manager.cpp \
    extend_time.cpp \
    give_feedback.cpp \
    insert_book.cpp \
    insert_opinion.cpp \
    main.cpp \
    mainwindow.cpp \
    manager_mainmenu.cpp \
    manager_message.cpp \
    manager_sigh_up.cpp \
    opinion_result.cpp \
    qmylabel.cpp \
    reader_mainmenu.cpp \
    reader_message.cpp \
    return_book.cpp \
    sigh_up.cpp \
    sysmanager_mainmenu.cpp \
    update_book.cpp

HEADERS += \
    book_message.h \
    borrow_book.h \
    borrow_message.h \
    change_password.h \
    delete_book.h \
    delete_manager.h \
    extend_time.h \
    give_feedback.h \
    insert_book.h \
    insert_opinion.h \
    mainwindow.h \
    manager_mainmenu.h \
    manager_message.h \
    manager_sigh_up.h \
    opinion_result.h \
    qmylabel.h \
    reader_mainmenu.h \
    reader_message.h \
    return_book.h \
    sigh_up.h \
    sysmanager_mainmenu.h \
    update_book.h

FORMS += \
    book_message.ui \
    borrow_book.ui \
    borrow_message.ui \
    change_password.ui \
    delete_book.ui \
    delete_manager.ui \
    extend_time.ui \
    give_feedback.ui \
    insert_book.ui \
    insert_opinion.ui \
    mainwindow.ui \
    manager_mainmenu.ui \
    manager_message.ui \
    manager_sigh_up.ui \
    opinion_result.ui \
    reader_mainmenu.ui \
    reader_message.ui \
    return_book.ui \
    sigh_up.ui \
    sysmanager_mainmenu.ui \
    update_book.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
