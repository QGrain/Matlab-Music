import sys
import gui
import tkinter as tk
from tkinter import filedialog
import matlab.engine
from gui import Ui_Dialog
from PyQt5.QtWidgets import QApplication, QDialog

eng = matlab.engine.start_matlab()
#eng.matlabsoftware(#maybe(nargout = 0))

class mygui(Ui_Dialog):
    def setupUi(self, Dialog):
        Ui_Dialog.setupUi(self,Dialog)
        self.stop.clicked.connect(self.stopclick)
        self.pause.clicked.connect(self.pauseclick)
        self.play.clicked.connect(self.playclick)
        self.quick.clicked.connect(self.quickclick)
        self.slow.clicked.connect(self.slowclick)
        self.add.clicked.connect(self.addclick)
        self.open.clicked.connect(self.openclick)

    def stopclick(self):
        print("stop")

    def pauseclick(self):
        print("pause")

    def playclick(self):
        print("play")

    def quickclick(self):
        print("quick")

    def slowclick(self):
        print("slow")

    def addclick(self):
        print("add")

    def openclick(self):
        root = tk.Tk()
        root.withdraw()
        file_path = filedialog.askopenfile()
        print("open")
        return file_path



if __name__ == '__main__':
    app = QApplication(sys.argv)
    MainWindow = QDialog()
    ui = mygui()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
    print(openclick())