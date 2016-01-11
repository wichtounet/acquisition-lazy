TARGET = acquisition
TEMPLATE = app

CONFIG += debug_and_release

QT += core gui network webkitwidgets testlib

win32 {
    QT += winextras
}

unix {
    LIBS += -ldl
}

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
lessThan(QT_MAJOR_VERSION, 5): QT += webkit

include(deps/QsLog/QsLog.pri)

INCLUDEPATH += include deps

SOURCES += \
    deps/sqlite/sqlite3.c \
    src/application.cpp \
    src/autoonline.cpp \
    src/bucket.cpp \
    src/buyoutmanager.cpp \
    src/column.cpp \
    src/currencymanager.cpp \
    src/sqlitedatastore.cpp \
    src/filesystem.cpp \
    src/filters.cpp \
    src/flowlayout.cpp \
    src/imagecache.cpp \
    src/item.cpp \
    src/itemlocation.cpp \
    src/items_model.cpp \
    src/itemsmanager.cpp \
    src/itemsmanagerworker.cpp \
    src/itemtooltip.cpp \
    src/logindialog.cpp \
    src/logpanel.cpp \
    src/main.cpp \
    src/mainwindow.cpp \
    src/memorydatastore.cpp \
    src/modlist.cpp \
    src/modsfilter.cpp \
    src/porting.cpp \
    src/replytimeout.cpp \
    src/search.cpp \
    src/shop.cpp \
    src/steamlogindialog.cpp \
    src/updatechecker.cpp \
    src/util.cpp \
    src/version.cpp \
    src/verticalscrollarea.cpp \
    src/lambda_connect.cpp \
    src/auto_price.cpp \
    test/testdata.cpp \
    test/testitem.cpp \
    test/testitemsmanager.cpp \
    test/testmain.cpp \
    test/testshop.cpp \
    test/testutil.cpp

HEADERS += \
    deps/sqlite/sqlite3.h \
    include/application.h \
    include/autoonline.h \
    include/bucket.h \
    include/buyoutmanager.h \
    include/column.h \
    include/currencymanager.h \
    include/datastore.h \
    include/sqlitedatastore.h \
    include/filesystem.h \
    include/filters.h \
    include/flowlayout.h \
    include/imagecache.h \
    include/item.h \
    include/itemconstants.h \
    include/itemlocation.h \
    include/items_model.h \
    include/itemsmanager.h \
    include/itemsmanagerworker.h \
    include/itemtooltip.h \
    include/logindialog.h \
    include/logpanel.h \
    include/mainwindow.h \
    include/memorydatastore.h \
    include/modlist.h \
    include/modsfilter.h \
    include/porting.h \
    include/rapidjson_util.h \
    include/replytimeout.h \
    include/search.h \
    include/selfdestructingreply.h \
    include/shop.h \
    include/steamlogindialog.h \
    include/updatechecker.h \
    include/util.h \
    include/version.h \
    include/version_defines.h \
    include/verticalscrollarea.h \
    include/lambda_connect.h \
    test/testdata.h \
    test/testitem.h \
    test/testitemsmanager.h \
    test/testmain.h \
    test/testshop.h \
    test/testutil.h

FORMS += \
    forms/mainwindow.ui \
    forms/logindialog.ui \
    forms/steamlogindialog.ui

greaterThan(QT_MAJOR_VERSION, 4){
    CONFIG += c++11
} else {
    QMAKE_CXXFLAGS += -std=c++0x
}

DEPENDPATH *= $${INCLUDEPATH}

RESOURCES += resources.qrc

RC_FILE = resources.rc

CONFIG(debug, debug|release){
    DESTDIR = ./build/debug
    OBJECTS_DIR = build/debug/.obj
    MOC_DIR = build/debug/.moc
    RCC_DIR = build/debug/.rcc
    UI_DIR = build/debug/.ui
}

CONFIG(release, debug|release){
    DESTDIR = ./build/release
    OBJECTS_DIR = build/release/.obj
    MOC_DIR = build/release/.moc
    RCC_DIR = build/release/.rcc
    UI_DIR = build/release/.ui
}
