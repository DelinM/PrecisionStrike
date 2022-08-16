from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QApplication, QmainWindow
import sys
import pandas


def window():
    app = QApplication(sys.argv)
    win = QmainWindow()
    win.setGeometry(200, 200, 300, 300)
    win.setWindowsTitle("title")

    label = QtWidgests.QLabels(win)
    label.setText('myst first label')
    label.move(50, 50)

    # show window
    win.show()

    # window will exit when click on exit button
    sys.exit(qpp.exec_())

window()