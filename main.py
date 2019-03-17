import sys
import re
from prompt_toolkit.eventloop import event

import gui
import tkinter as tk
from tkinter import filedialog
import easygui
import matlab.engine
#from gui import Ui_Dialog
import widget
from widget import Ui_Widget
from PyQt5.QtWidgets import QApplication, QDialog, QWidget, QMenu, QAction, QFileDialog, QMainWindow
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QIcon
import os
from save_txt import Ui_new_txt
from PyQt5.QtSql import QSqlQuery

eng = matlab.engine.start_matlab()
#eng.matlab.software(#maybe(nargout = 0))

class save_txt_dialog(Ui_new_txt):
    def setupUi(self, MAINWINDOW):
        Ui_new_txt.setupUi(self, MAINWINDOW)
        self.save.clicked.connect(self.saveclick)

    def saveclick(self):
        filename = QFileDialog.getSaveFileName(None, 'New_Txt', os.getenv('HOME'), 'TXT（*.txt')
        if(filename[0] != ''):
            with open(filename[0], 'w') as f:
                my_text = self.textEdit.toPlainText()
                f.write(my_text)



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
        self.open.clicked.connect(self.openclick)
        self.forward.clicked.connect(self.forwardclick)
        self.next.clicked.connect(self.nextclick)
        self.frame.setContextMenuPolicy(Qt.CustomContextMenu)
        self.frame.customContextMenuRequested.connect(self.custom_right_menu)

    def forwardclick(self):
        print("forward")

    def nextclick(self):
        print("next")


    def custom_right_menu(self, pos):

        menu = QMenu()
        changemainbackground = QAction()
        changemainbackground.setText("更换背景")
        changemainbackground.setIcon(QIcon(":/image/image/pf5.png"))
        changemainbackground.setShortcut("Ctrl+Q")
        changemainbackground.triggered.connect(self.change_main_background)
        opt1 = menu.addAction(changemainbackground)
        #opt2 = menu.addMenu("menu2")

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
            print(self.destinationPath)
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


    def openclick(self):
        root = tk.Tk()
        root.withdraw()
        filename = easygui.fileopenbox()
        if(filename == None):
            print("None")
        else:
            filename = filename.split("\\")
            filename = filename[len(filename) - 1]
            if(os.path.exists(".\\Matlab-Music\\song_data\\" + filename + ".mat")):    #如果mat文件存在
                print("existence")
                self.destinationPath = "F:\\PyQtGUI\\Matlab-Music\\song_data\\" + filename + ".mat"
            else:
                print("no existence")
                transitory = eng.generateAudioData(filename)
                self.destinationPath = transitory[0]
        print("open")


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QWidget()
    saveMainWindow = QMainWindow()
    #ui = Ui_Widget()
    savetxt = save_txt_dialog()
    ui = mygui()
    ui.setupUi(mainWindow)
    savetxt.setupUi(saveMainWindow)
    mainWindow.show()

    ui.add.clicked.connect(saveMainWindow.show)
    sys.exit(app.exec_())



"""
        filename = QFileDialog.getOpenFileName()
        with open(filename[0], 'r') as f:
            my_txt = f.read()
            self.textEdit.setPlainText(my_txt)
"""