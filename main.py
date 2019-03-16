import sys

from prompt_toolkit.eventloop import event

import gui
import tkinter as tk
from tkinter import filedialog
import easygui
import matlab.engine
#from gui import Ui_Dialog
import widget
from widget import Ui_Widget
from PyQt5.QtWidgets import QApplication, QDialog, QWidget, QMenu, QAction
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QIcon
from PyQt5.QtSql import QSqlQuery

eng = matlab.engine.start_matlab()
#eng.matlab.software(#maybe(nargout = 0))

#class mygui(Ui_Dialog):
class mygui(Ui_Widget):
    destinationPath = "None"
    static = "stop"


    def setupUi(self, Qwidget):
        #Ui_Dialog.setupUi(self,Dialog)
        Ui_Widget.setupUi(self, Qwidget)
        #self.stop.clicked.connect(self.stopclick)
        #self.pause.clicked.connect(self.pauseclick)
        self.play.clicked.connect(self.playclick)
        #self.quick.clicked.connect(self.quickclick)
        #self.slow.clicked.connect(self.slowclick)
        #self.add.clicked.connect(self.addclick)
        self.open.clicked.connect(self.openclick)
        self.frame.setContextMenuPolicy(Qt.CustomContextMenu)
        self.frame.customContextMenuRequested.connect(self.custom_right_menu)

    def custom_right_menu(self, pos):

        menu = QMenu()
        changemainbackground = QAction()
        changemainbackground.setText("更换背景")
        changemainbackground.setIcon(QIcon(":/image/image/pf5.png"))
        changemainbackground.setShortcut("Ctrl+C")
        changemainbackground.triggered.connect(self.change_main_background)
        opt1 = menu.addAction(changemainbackground)
        opt2 = menu.addMenu("menu2")

        action = menu.exec_(self.frame.mapToGlobal(pos))
        '''
        if action == opt1:
            self.change_main_background()
            print("menu1")
            # do something
            return
        #elif action == opt2:
            #print("menu2")
            # do something
            #return
        else:
            return
        '''

    def PaseStyle(self):
        return "QPushButton"\
        " {"\
        "background-image:url(:/image/image/image/pase.png);"\
        "   background-repeat:no-repeat;"\
        "  background-position:center center;"\
        "   border:none;"\
        "    }"\
        "QPushButton:hover{"\
        "  background-repeat:no-repeat;"\
        "   background-position:center center;"\
        "background-image:url(:/image/image/image-hover/pase-hover.png);"\
        " }"\
        " QPushButton:pressed{"\
        "background-repeat:no-repeat;"\
        " background-position:center center;"\
        " background-image:url(:/image/image/image/pase.png);"\
        "}"

    def PlayStyle(self):
        return "QPushButton"\
        " {"\
        "background-image:url(:/image/image/image/play.png);"\
        "   background-repeat:no-repeat;"\
        "  background-position:center center;"\
        "   border:none;"\
        "    }"\
        "QPushButton:hover{"\
        "  background-repeat:no-repeat;"\
        "   background-position:center center;"\
        "background-image:url(:/image/image/image-hover/play-hover.png);"\
        " }"\
        " QPushButton:pressed{"\
        "background-repeat:no-repeat;"\
        " background-position:center center;"\
        " background-image:url(:/image/image/image/play.png);"\
        "}"

    def on_play_clicked(self):
        if(self.static == "stop"):
            ui.play.setStyleSheet(self.PaseStyle())
            ui.play.setToolTip("暂停")
            self.static = "play"
            eng.playMat(self.destinationPath, nargout=0)
        else:
            ui.play.setStyleSheet(self.PlayStyle())
            ui.play.setToolTip("播放")
            self.static = "stop"

    def change_main_background(self):
        root = tk.Tk()
        root.withdraw()
        filename = easygui.fileopenbox()
        if (filename == None):
            print("None")
        else:
            filename = filename.split("\\")
            self.frame.setStyleSheet("QFrame#frame{\n"
            "border-radius:5px;border-image: url(:/image/image/background/"+ filename[len(filename) - 1] + ");\n"
            "}")

    def stopclick(self):
        print("stop")

    def pauseclick(self):
        print("pause")


    def playclick(self):
        print("play")
        #global destinationPath
        print(self.destinationPath)
        if("None" == self.destinationPath):
            print("Have no such file")
        else:
            self.on_play_clicked()

    def quickclick(self):
        print("quick")

    def slowclick(self):
        print("slow")

    def addclick(self):
        print("add")


    def openclick(self):
        root = tk.Tk()
        root.withdraw()
        filename = easygui.fileopenbox()
        if(filename == None):
            print("None")
        else:
            filename = filename.split("\\")
            filename = filename[len(filename) - 1]
            transitory = eng.generateAudioData(filename)
            self.destinationPath = transitory[0]
            print("open")


if __name__ == '__main__':
    app = QApplication(sys.argv)
    MainWindow = QWidget()
    #ui = Ui_Widget()
    ui = mygui()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
    print(openclick())