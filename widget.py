# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'widget.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Widget(object):
    def setupUi(self, Widget):
        Widget.setObjectName("Widget")
        Widget.setWindowModality(QtCore.Qt.NonModal)
        Widget.setEnabled(True)
        Widget.resize(1220, 720)
        Widget.setMinimumSize(QtCore.QSize(1220, 720))
        Widget.setMaximumSize(QtCore.QSize(1220, 720))
        Widget.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/image/image/ios8_Music_32px_1173465_easyicon.net.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Widget.setWindowIcon(icon)
        Widget.setAutoFillBackground(False)
        Widget.setStyleSheet("QWidget{\n"
"\n"
"background-repeat:no-repeat;\n"
"\n"
"\n"
"\n"
"}")
        self.forward = QtWidgets.QPushButton(Widget)
        self.forward.setGeometry(QtCore.QRect(10, 648, 48, 48))
        self.forward.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.forward.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/pre.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/pre-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/pre.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.forward.setText("")
        self.forward.setObjectName("forward")
        self.stackedWidget = QtWidgets.QStackedWidget(Widget)
        self.stackedWidget.setEnabled(True)
        self.stackedWidget.setGeometry(QtCore.QRect(12, 110, 350, 531))
        self.stackedWidget.setObjectName("stackedWidget")
        self.page = QtWidgets.QWidget()
        self.page.setObjectName("page")
        self.listWidget_3 = QtWidgets.QListWidget(self.page)
        self.listWidget_3.setGeometry(QtCore.QRect(0, 0, 350, 531))
        font = QtGui.QFont()
        font.setFamily("Comic Sans MS")
        font.setPointSize(12)
        font.setBold(False)
        font.setItalic(False)
        font.setWeight(9)
        self.listWidget_3.setFont(font)
        self.listWidget_3.viewport().setProperty("cursor", QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.listWidget_3.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.listWidget_3.setStyleSheet("QListWidget{\n"
"font: 75 12pt \"Comic Sans MS\";\n"
"background-color:transparent;\n"
"\n"
"}\n"
"QListWidget::item{\n"
"color:rgb(120,120,120);\n"
"border:none;\n"
"margin-top:3px;\n"
"\n"
"}\n"
"QListWidget::item:hover{\n"
"padding-left:4px;\n"
"margin-top:3px;\n"
"color:rgb(100,100,100);\n"
"background-color:rgba(255,255,255,0.2);\n"
"\n"
"\n"
"\n"
"}\n"
"QListWidget::item:selected{\n"
"outline:none;\n"
"margin-top:3px;\n"
"padding-left:4px;\n"
"background-color:rgba(255,255,255,0.5);\n"
"color:rgb(0,0,0);\n"
"}\n"
"QListWidget::item:!active{\n"
"margin-top:3px;\n"
"border:none;\n"
"background-color:rgba(255,255,255,0);\n"
"color:rgb(120,120,120);\n"
"}\n"
"\n"
"\n"
"\n"
"")
        self.listWidget_3.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.listWidget_3.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.listWidget_3.setLineWidth(0)
        self.listWidget_3.setMidLineWidth(0)
        self.listWidget_3.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.listWidget_3.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.listWidget_3.setDefaultDropAction(QtCore.Qt.CopyAction)
        self.listWidget_3.setAlternatingRowColors(False)
        self.listWidget_3.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.listWidget_3.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectItems)
        self.listWidget_3.setLayoutMode(QtWidgets.QListView.SinglePass)
        self.listWidget_3.setSelectionRectVisible(False)
        self.listWidget_3.setObjectName("listWidget_3")
        self.stackedWidget.addWidget(self.page)
        self.page_3 = QtWidgets.QWidget()
        self.page_3.setObjectName("page_3")
        self.listWidget_2 = QtWidgets.QListWidget(self.page_3)
        self.listWidget_2.setGeometry(QtCore.QRect(0, 0, 350, 531))
        font = QtGui.QFont()
        font.setFamily("Comic Sans MS")
        font.setPointSize(12)
        font.setBold(False)
        font.setItalic(False)
        font.setWeight(9)
        self.listWidget_2.setFont(font)
        self.listWidget_2.viewport().setProperty("cursor", QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.listWidget_2.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.listWidget_2.setStyleSheet("QListWidget{\n"
"font: 75 12pt \"Comic Sans MS\";\n"
"background-color:transparent;\n"
"\n"
"}\n"
"QListWidget::item{\n"
"color:rgb(120,120,120);\n"
"border:none;\n"
"margin-top:3px;\n"
"\n"
"}\n"
"QListWidget::item:hover{\n"
"padding-left:4px;\n"
"margin-top:3px;\n"
"color:rgb(100,100,100);\n"
"background-color:rgba(255,255,255,0.2);\n"
"\n"
"\n"
"\n"
"}\n"
"QListWidget::item:selected{\n"
"outline:none;\n"
"margin-top:3px;\n"
"padding-left:4px;\n"
"background-color:rgba(255,255,255,0.5);\n"
"color:rgb(0,0,0);\n"
"}\n"
"QListWidget::item:!active{\n"
"margin-top:3px;\n"
"border:none;\n"
"background-color:rgba(255,255,255,0);\n"
"color:rgb(120,120,120);\n"
"}\n"
"\n"
"\n"
"\n"
"")
        self.listWidget_2.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.listWidget_2.setFrameShadow(QtWidgets.QFrame.Plain)
        self.listWidget_2.setLineWidth(0)
        self.listWidget_2.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.listWidget_2.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.listWidget_2.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.listWidget_2.setBatchSize(100)
        self.listWidget_2.setObjectName("listWidget_2")
        self.stackedWidget.addWidget(self.page_3)
        self.page_2 = QtWidgets.QWidget()
        self.page_2.setObjectName("page_2")
        self.listWidget = QtWidgets.QListWidget(self.page_2)
        self.listWidget.setGeometry(QtCore.QRect(0, 0, 350, 531))
        font = QtGui.QFont()
        font.setFamily("Comic Sans MS")
        font.setPointSize(12)
        font.setBold(False)
        font.setItalic(False)
        font.setWeight(9)
        self.listWidget.setFont(font)
        self.listWidget.viewport().setProperty("cursor", QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.listWidget.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.listWidget.setStyleSheet("QListWidget{\n"
"font: 75 12pt \"Comic Sans MS\";\n"
"background-color:transparent;\n"
"\n"
"}\n"
"QListWidget::item{\n"
"color:rgb(120,120,120);\n"
"border:none;\n"
"margin-top:3px;\n"
"\n"
"}\n"
"QListWidget::item:hover{\n"
"padding-left:4px;\n"
"margin-top:3px;\n"
"color:rgb(100,100,100);\n"
"background-color:rgba(255,255,255,0.2);\n"
"\n"
"\n"
"\n"
"}\n"
"QListWidget::item:selected{\n"
"outline:none;\n"
"margin-top:3px;\n"
"padding-left:4px;\n"
"background-color:rgba(255,255,255,0.5);\n"
"color:rgb(0,0,0);\n"
"}\n"
"QListWidget::item:!active{\n"
"margin-top:3px;\n"
"border:none;\n"
"background-color:rgba(255,255,255,0);\n"
"color:rgb(120,120,120);\n"
"}\n"
"\n"
"\n"
"\n"
"")
        self.listWidget.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.listWidget.setFrameShadow(QtWidgets.QFrame.Plain)
        self.listWidget.setLineWidth(0)
        self.listWidget.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.listWidget.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.listWidget.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.listWidget.setObjectName("listWidget")
        self.stackedWidget.addWidget(self.page_2)
        self.page_4 = QtWidgets.QWidget()
        self.page_4.setObjectName("page_4")
        self.listWidget_4 = QtWidgets.QListWidget(self.page_4)
        self.listWidget_4.setGeometry(QtCore.QRect(0, 0, 350, 531))
        self.listWidget_4.viewport().setProperty("cursor", QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.listWidget_4.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.listWidget_4.setStyleSheet("QListWidget{\n"
"font: 75 12pt \"Comic Sans MS\";\n"
"background-color:transparent;\n"
"\n"
"}\n"
"QListWidget::item{\n"
"color:rgb(120,120,120);\n"
"border:none;\n"
"margin-top:3px;\n"
"\n"
"}\n"
"QListWidget::item:hover{\n"
"padding-left:4px;\n"
"margin-top:3px;\n"
"color:rgb(100,100,100);\n"
"background-color:rgba(255,255,255,0.2);\n"
"\n"
"\n"
"\n"
"}\n"
"QListWidget::item:selected{\n"
"outline:none;\n"
"margin-top:3px;\n"
"padding-left:4px;\n"
"background-color:rgba(255,255,255,0.5);\n"
"color:rgb(0,0,0);\n"
"}\n"
"QListWidget::item:!active{\n"
"margin-top:3px;\n"
"border:none;\n"
"background-color:rgba(255,255,255,0);\n"
"color:rgb(120,120,120);\n"
"}\n"
"\n"
"\n"
"\n"
"")
        self.listWidget_4.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.listWidget_4.setFrameShadow(QtWidgets.QFrame.Raised)
        self.listWidget_4.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.listWidget_4.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.listWidget_4.setObjectName("listWidget_4")
        self.stackedWidget.addWidget(self.page_4)
        self.page_5 = QtWidgets.QWidget()
        self.page_5.setObjectName("page_5")
        self.listWidget_5 = QtWidgets.QListWidget(self.page_5)
        self.listWidget_5.setGeometry(QtCore.QRect(0, 0, 350, 531))
        self.listWidget_5.viewport().setProperty("cursor", QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.listWidget_5.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.listWidget_5.setStyleSheet("QListWidget{\n"
"font: 75 12pt \"Comic Sans MS\";\n"
"background-color:transparent;\n"
"\n"
"}\n"
"QListWidget::item{\n"
"color:rgb(120,120,120);\n"
"border:none;\n"
"margin-top:3px;\n"
"\n"
"}\n"
"QListWidget::item:hover{\n"
"padding-left:4px;\n"
"margin-top:3px;\n"
"color:rgb(100,100,100);\n"
"background-color:rgba(255,255,255,0.2);\n"
"\n"
"\n"
"\n"
"}\n"
"QListWidget::item:selected{\n"
"outline:none;\n"
"margin-top:3px;\n"
"padding-left:4px;\n"
"background-color:rgba(255,255,255,0.5);\n"
"color:rgb(0,0,0);\n"
"}\n"
"QListWidget::item:!active{\n"
"margin-top:3px;\n"
"border:none;\n"
"background-color:rgba(255,255,255,0);\n"
"color:rgb(120,120,120);\n"
"}\n"
"\n"
"\n"
"\n"
"")
        self.listWidget_5.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.listWidget_5.setLineWidth(0)
        self.listWidget_5.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAsNeeded)
        self.listWidget_5.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.listWidget_5.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.listWidget_5.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectItems)
        self.listWidget_5.setObjectName("listWidget_5")
        self.stackedWidget.addWidget(self.page_5)
        self.frame = QtWidgets.QFrame(Widget)
        self.frame.setEnabled(True)
        self.frame.setGeometry(QtCore.QRect(10, 10, 1200, 700))
        self.frame.setMinimumSize(QtCore.QSize(1200, 700))
        self.frame.setMaximumSize(QtCore.QSize(1200, 700))
        self.frame.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.frame.setStyleSheet("QFrame#frame{\n"
"border-radius:5px;border-image: url(:/image/image/background/bg3.jpg);\n"
"}")
        self.frame.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.frame.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.frame.setLineWidth(1)
        self.frame.setObjectName("frame")
        self.pushButton_17 = QtWidgets.QPushButton(self.frame)
        self.pushButton_17.setGeometry(QtCore.QRect(1165, 0, 32, 32))
        self.pushButton_17.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_17.setStyleSheet("QPushButton\n"
"{\n"
"border-radius:0px;\n"
"background-image: url(:/image/image/quit.png);\n"
"background-color: rgba(255, 255, 255,0);\n"
"background-repeat:no-repeat;\n"
"border:none;\n"
"background-position:center center;\n"
"\n"
"}\n"
"QPushButton:hover{\n"
"\n"
"background-color: rgba(230,0,0,0.5);\n"
"}\n"
"QPushButton:pressed{\n"
"background-color: rgba(95, 95, 95,100);\n"
"border-color:rgba(255,255,255,30);\n"
"border-style:inset;\n"
"color:rgba(0,0,0,100);\n"
"\n"
"}\n"
"")
        self.pushButton_17.setText("")
        self.pushButton_17.setObjectName("pushButton_17")
        self.pushButton_16 = QtWidgets.QPushButton(self.frame)
        self.pushButton_16.setGeometry(QtCore.QRect(1100, 0, 32, 32))
        self.pushButton_16.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_16.setStyleSheet("QPushButton\n"
"{\n"
"border-radius:0px;\n"
"background-image: url(:/image/image/min.png);\n"
"background-color: rgba(255, 255, 255,0);\n"
"background-repeat:no-repeat;\n"
"border:none;\n"
"background-position:center center;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"    background-color: rgb(255, 255, 255,100);\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"    background-color: rgba(95, 95, 95,100);\n"
"border-color:rgba(255,255,255,30);\n"
"border-style:inset;\n"
"color:rgba(0,0,0,100);\n"
"\n"
"}\n"
"")
        self.pushButton_16.setText("")
        self.pushButton_16.setObjectName("pushButton_16")
        self.pushButton_8 = QtWidgets.QPushButton(self.frame)
        self.pushButton_8.setGeometry(QtCore.QRect(1150, 650, 32, 32))
        self.pushButton_8.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_8.setStyleSheet("QPushButton\n"
"{\n"
"\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_8.setText("")
        self.pushButton_8.setObjectName("pushButton_8")
        self.verticalSlider = QtWidgets.QSlider(self.frame)
        self.verticalSlider.setGeometry(QtCore.QRect(1150, 460, 35, 181))
        self.verticalSlider.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.verticalSlider.setStyleSheet(" QSlider \n"
"    {  \n"
"        background-color: rgba(255,255,255,0.2);\n"
"        min-width:5px; \n"
"        max-width:5px;\n"
"        border:15px solid rgba(255,255,255,0.2); \n"
"    }\n"
"     QSlider::add-page:vertical\n"
"     {      \n"
"       \n"
"        background-color: rgb(250, 250, 0);\n"
"        width:4px;\n"
"     }\n"
"     QSlider::sub-page:vertical  \n"
"    {\n"
"        background-color: rgba(255,255,255,0.5); \n"
"        width:4px;\n"
"     }\n"
"    QSlider::groove:vertical \n"
"    {\n"
"        background:transparent;\n"
"        width:6px;\n"
"    }\n"
"    QSlider::handle:vertical \n"
"    {\n"
"         height: 13px;\n"
"        width:13px;\n"
" \n"
" margin: -0 -4px; \n"
"    border-image: url(:/image/image/圆形 (10).png);\n"
"     }")
        self.verticalSlider.setOrientation(QtCore.Qt.Vertical)
        self.verticalSlider.setTickPosition(QtWidgets.QSlider.NoTicks)
        self.verticalSlider.setObjectName("verticalSlider")
        self.pushButton_19 = QtWidgets.QPushButton(self.frame)
        self.pushButton_19.setGeometry(QtCore.QRect(1132, 0, 32, 32))
        self.pushButton_19.setStyleSheet("QPushButton\n"
"{\n"
"border-radius:0px;\n"
"background-image: url(:/image/image/max.png);\n"
"background-color: rgba(255, 255, 255,0);\n"
"background-repeat:no-repeat;\n"
"border:none;\n"
"background-position:center center;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"    background-color: rgb(255, 255, 255,100);\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"    background-color: rgba(95, 95, 95,100);\n"
"border-color:rgba(255,255,255,30);\n"
"border-style:inset;\n"
"color:rgba(0,0,0,100);\n"
"\n"
"}\n"
"")
        self.pushButton_19.setText("")
        self.pushButton_19.setObjectName("pushButton_19")
        self.horizontalSlider = QtWidgets.QSlider(self.frame)
        self.horizontalSlider.setGeometry(QtCore.QRect(300, 650, 661, 31))
        self.horizontalSlider.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.horizontalSlider.setStyleSheet("\n"
"    QSlider::add-page:Horizontal\n"
"     {     \n"
"background-color: rgba(255, 255, 255,100);\n"
"        height:4px;  \n"
"     } \n"
"     QSlider::sub-page:Horizontal   \n"
"    {  \n"
"background-color: rgb(255, 255, 255);\n"
"        height:4px;\n"
"     }\n"
"    QSlider::groove:Horizontal   \n"
"    { \n"
"        background:transparent; \n"
"        height:4px;\n"
"    }  \n"
"    QSlider::handle:Horizontal  \n"
"    { \n"
"        height:16px; \n"
"        width:16px; \n"
"    \n"
"    border-image: url(:/image/image/圆形 (9).png);\n"
"  margin: -6 0px; \n"
"    }\n"
"      \n"
"")
        self.horizontalSlider.setOrientation(QtCore.Qt.Horizontal)
        self.horizontalSlider.setObjectName("horizontalSlider")
        self.pushButton_7 = QtWidgets.QPushButton(self.frame)
        self.pushButton_7.setGeometry(QtCore.QRect(1066, 650, 32, 32))
        self.pushButton_7.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_7.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/position.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-image: url(:/image/image/image-hover/position-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/position.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_7.setText("")
        self.pushButton_7.setObjectName("pushButton_7")
        self.pushButton = QtWidgets.QPushButton(self.frame)
        self.pushButton.setGeometry(QtCore.QRect(916, -32, 32, 32))
        self.pushButton.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton.setStyleSheet("\n"
"QPushButton\n"
"{\n"
"color:transparent;\n"
"background-image: url(:/image/image/image/add.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"    background-image: url(:/image/image/image-hover/add-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/add.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"\n"
"")
        self.pushButton.setText("")
        self.pushButton.setObjectName("pushButton")
        self.pushButton_5 = QtWidgets.QPushButton(self.frame)
        self.pushButton_5.setGeometry(QtCore.QRect(1020, -32, 32, 32))
        self.pushButton_5.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_5.setStyleSheet("QPushButton\n"
"{\n"
"color: rgba(255, 255, 255,0);\n"
"background-image: url(:/image/image/image/setting.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"background-image: url(:/image/image/image-hover/setting.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/setting.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"\n"
"")
        self.pushButton_5.setText("")
        self.pushButton_5.setObjectName("pushButton_5")
        self.pushButton_6 = QtWidgets.QPushButton(self.frame)
        self.pushButton_6.setGeometry(QtCore.QRect(968, -32, 32, 32))
        self.pushButton_6.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_6.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/face.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"color:transparent;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"background-image: url(:/image/image/face-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
" background-image: url(:/image/image/face.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_6.setText("")
        self.pushButton_6.setObjectName("pushButton_6")
        self.pushButton_13 = QtWidgets.QPushButton(self.frame)
        self.pushButton_13.setGeometry(QtCore.QRect(864, -32, 32, 32))
        self.pushButton_13.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_13.setStyleSheet("QPushButton\n"
"{\n"
"color:transparent;\n"
"background-image: url(:/image/image/image/left-arrow.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"    background-image: url(:/image/image/image-hover/left-arrow-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/left-arrow.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_13.setText("")
        self.pushButton_13.setObjectName("pushButton_13")
        self.open = QtWidgets.QPushButton(self.frame)
        self.open.setGeometry(QtCore.QRect(750, 20, 32, 32))
        self.open.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.open.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/sereach.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"background-image: url(:/image/image/image-hover/sereach-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/sereach.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.open.setText("")
        self.open.setObjectName("open")
        self.lineEdit = QtWidgets.QLineEdit(self.frame)
        self.lineEdit.setGeometry(QtCore.QRect(400, 20, 341, 32))
        self.lineEdit.setCursor(QtGui.QCursor(QtCore.Qt.IBeamCursor))
        self.lineEdit.setStyleSheet("QLineEdit{\n"
"background-color: rgba(255, 255, 255,150);\n"
"border-style:outset;\n"
"\n"
"border-width:0px;\n"
"\n"
"border-radius:10px;\n"
"border-color: rgba(0,0,0,100);\n"
"font:bold 14px;\n"
"color:rgb(180,180,180);\n"
"padding:6px;\n"
"}")
        self.lineEdit.setInputMethodHints(QtCore.Qt.ImhNone)
        self.lineEdit.setText("")
        self.lineEdit.setObjectName("lineEdit")
        self.pushButton_11 = QtWidgets.QPushButton(self.frame)
        self.pushButton_11.setGeometry(QtCore.QRect(80, 60, 32, 32))
        self.pushButton_11.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_11.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/like.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/like-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/like.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_11.setText("")
        self.pushButton_11.setObjectName("pushButton_11")
        self.pushButton_10 = QtWidgets.QPushButton(self.frame)
        self.pushButton_10.setGeometry(QtCore.QRect(10, 60, 32, 32))
        self.pushButton_10.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_10.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/music.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/music-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/music.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_10.setText("")
        self.pushButton_10.setObjectName("pushButton_10")
        self.pushButton_12 = QtWidgets.QPushButton(self.frame)
        self.pushButton_12.setGeometry(QtCore.QRect(160, 60, 31, 31))
        self.pushButton_12.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_12.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/list.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/list-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/list.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_12.setText("")
        self.pushButton_12.setObjectName("pushButton_12")
        self.pushButton_9 = QtWidgets.QPushButton(self.frame)
        self.pushButton_9.setGeometry(QtCore.QRect(1024, 650, 32, 32))
        self.pushButton_9.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_9.setStyleSheet("QPushButton\n"
"{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_9.setText("")
        self.pushButton_9.setObjectName("pushButton_9")
        self.pushButton_14 = QtWidgets.QPushButton(self.frame)
        self.pushButton_14.setGeometry(QtCore.QRect(982, 650, 32, 32))
        self.pushButton_14.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_14.setStyleSheet("QPushButton\n"
"{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_14.setText("")
        self.pushButton_14.setObjectName("pushButton_14")
        self.pushButton_20 = QtWidgets.QPushButton(self.frame)
        self.pushButton_20.setGeometry(QtCore.QRect(1068, 0, 32, 32))
        self.pushButton_20.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_20.setStyleSheet("QPushButton\n"
"{\n"
"border-radius:0px;\n"
"background-image: url(:/image/image/tr.png);\n"
"background-color: rgba(255, 255, 255,0);\n"
"background-repeat:no-repeat;\n"
"border:none;\n"
"background-position:center center;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"\n"
"\n"
"    background-color: rgb(255, 255, 255,100);\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"    background-color: rgba(95, 95, 95,100);\n"
"border-color:rgba(255,255,255,30);\n"
"border-style:inset;\n"
"color:rgba(0,0,0,100);\n"
"\n"
"}\n"
"")
        self.pushButton_20.setText("")
        self.pushButton_20.setObjectName("pushButton_20")
        self.next = QtWidgets.QPushButton(self.frame)
        self.next.setGeometry(QtCore.QRect(230, 638, 48, 48))
        self.next.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.next.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/next.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-image: url(:/image/image/image-hover/next-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/next.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.next.setText("")
        self.next.setObjectName("next")
        self.play = QtWidgets.QPushButton(self.frame)
        self.play.setGeometry(QtCore.QRect(118, 640, 48, 48))
        self.play.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.play.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/play.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"background-image:url(:/image/image/image-hover/pase-hover.png);\n"
"}\n"
"QPushButton:pressed{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"background-image:url(:/image/image/image/pase.png);\n"
"\n"
"}\n"
"")
        self.play.setText("")
        self.play.setObjectName("play")
        self.pushButton_21 = QtWidgets.QPushButton(self.frame)
        self.pushButton_21.setGeometry(QtCore.QRect(1108, 650, 32, 32))
        self.pushButton_21.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_21.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/playlist.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/playlist-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/playlist.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_21.setText("")
        self.pushButton_21.setObjectName("pushButton_21")
        self.pushButton_22 = QtWidgets.QPushButton(self.frame)
        self.pushButton_22.setGeometry(QtCore.QRect(240, 60, 32, 32))
        self.pushButton_22.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_22.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/play-resently.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/play-resently-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/play-resently.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_22.setText("")
        self.pushButton_22.setObjectName("pushButton_22")
        self.pushButton_15 = QtWidgets.QPushButton(self.frame)
        self.pushButton_15.setGeometry(QtCore.QRect(320, 60, 32, 32))
        self.pushButton_15.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.pushButton_15.setStyleSheet("QPushButton\n"
"{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}\n"
"")
        self.pushButton_15.setText("")
        self.pushButton_15.setObjectName("pushButton_15")
        self.label_5 = QtWidgets.QLabel(self.frame)
        self.label_5.setGeometry(QtCore.QRect(10, 10, 291, 31))
        self.label_5.setStyleSheet("QLabel{\n"
"\n"
"    font: 75 pt \"Comic Sans MS\";\n"
"color:rgba(255,255,255,0.5);\n"
"   \n"
" \n"
"\n"
"}")
        self.label_5.setObjectName("label_5")
        self.label_2 = QtWidgets.QLabel(self.frame)
        self.label_2.setGeometry(QtCore.QRect(850, 630, 111, 21))
        self.label_2.setStyleSheet("font: 75 italic 11pt \"Comic Sans MS\";\n"
"color: rgb(112, 112, 112);")
        self.label_2.setText("")
        self.label_2.setObjectName("label_2")
        self.label = QtWidgets.QLabel(self.frame)
        self.label.setGeometry(QtCore.QRect(370, 600, 521, 31))
        self.label.setStyleSheet("font: 75 11pt \"Comic Sans MS\";\n"
"color: rgb(112, 112, 112);")
        self.label.setText("")
        self.label.setObjectName("label")
        self.label_3 = QtWidgets.QLabel(self.frame)
        self.label_3.setGeometry(QtCore.QRect(400, 390, 510, 32))
        self.label_3.setStyleSheet("font: 75 italic 12pt \"Comic Sans MS\";\n"
"color: rgb(75, 75, 75);")
        self.label_3.setText("")
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(self.frame)
        self.label_4.setGeometry(QtCore.QRect(670, 450, 460, 32))
        self.label_4.setStyleSheet("font: 75 italic 12pt \"Comic Sans MS\";\n"
"color: rgb(75, 75, 75);")
        self.label_4.setText("")
        self.label_4.setObjectName("label_4")
        self.add = QtWidgets.QPushButton(self.frame)
        self.add.setGeometry(QtCore.QRect(320, 60, 32, 32))
        self.add.setStyleSheet("QPushButton\n"
"{\n"
"background-image: url(:/image/image/image/add.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"border:none;\n"
"\n"
"}\n"
"\n"
"QPushButton:hover{\n"
"\n"
"    background-image: url(:/image/image/image-hover/add-hover.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"\n"
"}\n"
"QPushButton:pressed{\n"
"background-image: url(:/image/image/image/add.png);\n"
"background-repeat:no-repeat;\n"
"background-position:center center;\n"
"\n"
"}")
        self.add.setText("")
        self.add.setObjectName("add")
        self.frame.raise_()
        self.forward.raise_()
        self.stackedWidget.raise_()

        self.retranslateUi(Widget)
        self.stackedWidget.setCurrentIndex(4)
        QtCore.QMetaObject.connectSlotsByName(Widget)

    def retranslateUi(self, Widget):
        _translate = QtCore.QCoreApplication.translate
        Widget.setWindowTitle(_translate("Widget", "我的音乐"))
        self.listWidget.setSortingEnabled(False)
        self.open.setToolTip(_translate("Widget", "搜索"))
        self.lineEdit.setToolTip(_translate("Widget", "输入歌曲或歌手"))
        self.lineEdit.setStatusTip(_translate("Widget", "输入歌曲"))
        self.pushButton_20.setToolTip(_translate("Widget", "更多"))
        self.pushButton_20.setStatusTip(_translate("Widget", "更多"))
        self.pushButton_22.setToolTip(_translate("Widget", "最近播放"))
        self.pushButton_22.setStatusTip(_translate("Widget", "最近播放"))
        self.label_5.setText(_translate("Widget", " MyMusic"))

import image_rc
