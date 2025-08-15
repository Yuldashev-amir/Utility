import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

RowLayout {
    property var step: parent.height / 8

    anchors.left: parent.left
    anchors.leftMargin: step / 4
    anchors.right: parent.right
    anchors.rightMargin: step / 4
    anchors.top: parent.top
    anchors.topMargin: step / 4
    height: step
    spacing: step / 8
    Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height
        color: "transparent"
    }
    TabBar {
        id: tabBar

        implicitHeight: 50
        implicitWidth: parent.width / 8

        background: Rectangle {
            color: "transparent"
        }
        TabButton {
            text: "kk"

            background: Rectangle {
                color: tabBar.currentIndex == 0 ? "black" : "gray"
            }

            onClicked: {
                Qt.uiLanguage = "kk"
            }
        }
        TabButton {
            text: "ru"

            background: Rectangle {
                color: tabBar.currentIndex == 1 ? "black" : "gray"
            }

            onClicked: {
                Qt.uiLanguage = "ru"
            }
        }
        TabButton {
            text: "en"

            background: Rectangle {
                color: tabBar.currentIndex == 2 ? "black" : "gray"
            }

            onClicked: {
                Qt.uiLanguage = "en"
            }
        }
    }
}
