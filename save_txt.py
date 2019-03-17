# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'save_txt.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_new_txt(object):
    def setupUi(self, new_txt):
        new_txt.setObjectName("new_txt")
        new_txt.resize(1200, 800)
        self.centralwidget = QtWidgets.QWidget(new_txt)
        self.centralwidget.setObjectName("centralwidget")
        self.textEdit = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit.setGeometry(QtCore.QRect(113, 26, 991, 561))
        self.textEdit.setStyleSheet("font: 28pt \"Agency FB\";")
        self.textEdit.setObjectName("textEdit")
        self.layoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.layoutWidget.setGeometry(QtCore.QRect(400, 630, 411, 30))
        self.layoutWidget.setObjectName("layoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.layoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setSpacing(50)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.save = QtWidgets.QPushButton(self.layoutWidget)
        self.save.setObjectName("save")
        self.horizontalLayout.addWidget(self.save)
        self.cancel = QtWidgets.QPushButton(self.layoutWidget)
        self.cancel.setObjectName("cancel")
        self.horizontalLayout.addWidget(self.cancel)
        new_txt.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(new_txt)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1200, 26))
        self.menubar.setObjectName("menubar")
        new_txt.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(new_txt)
        self.statusbar.setObjectName("statusbar")
        new_txt.setStatusBar(self.statusbar)

        self.retranslateUi(new_txt)
        self.cancel.clicked.connect(new_txt.close)
        QtCore.QMetaObject.connectSlotsByName(new_txt)

    def retranslateUi(self, new_txt):
        _translate = QtCore.QCoreApplication.translate
        new_txt.setWindowTitle(_translate("new_txt", "MainWindow"))
        self.save.setText(_translate("new_txt", "Save"))
        self.cancel.setText(_translate("new_txt", "Cancel"))

