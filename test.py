from PyQt5 import QtWidgets
import sys
import gui

class mywindow(QtWidgets.QDialog,gui):
    def __init__(self):
        super(mywindow,self).__init__()
        self.setupUi(self)

    #定义槽函数
    def hello(self):
        self.textEdit.setText("hello world")

app = QtWidgets.QApplication(sys.argv)
window = mywindow()
window.show()
sys.exit(app.exec_())

