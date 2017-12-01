TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += src/common/math_utils.cpp \
    src/main/main.cpp \
    src/scheme_operator.cpp

HEADERS += \
    src/common/debug_utils.h \
    src/common/math_utils.h \
    src/common/utils.h \
    src/precompiled/precompiled_header.h \
    src/scheme_operator.h

INCLUDEPATH += src
