import QtQuick
import QtQuick.Controls
import Clipboard

Item {
    id: root
    width: parent.width
    height: parent.height
    property string macAddress: macAddress.text
    property string placeAddress: placeAddress.text

    Rectangle {
        id: inputPlace
        width: parent.width / 2
        height: parent.height / 3
        anchors.horizontalCenter: parent.horizontalCenter
        color: "gray"
        radius: 8
        Column {
            spacing: 15
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 40
            anchors.leftMargin: 20
            Row {
                spacing: 5
                Text {
                    id: macAddress
                    text: root.macAddress
                    font.pixelSize: 20
                }
                Button {
                    id: btnCopy
                    background: Rectangle {
                        color: "transparent"
                        Image {
                            width: 20
                            height: 20
                            source: "file://home/amir/ProjectsQT/Utility/demo/Demo/res/img/files_11796832.png"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            Clipboard.textSet(macAddress.text)
                        }
                    }
                }
            }
            Row {
                spacing: 8
                Text {
                    id: placeAddress
                    text: root.placeAddress
                    font.pixelSize: 20
                }
                Button {
                    id: btnCopy2
                    background: Rectangle {
                        color: "transparent"
                        Image {
                            width: 20
                            height: 20
                            source: "file://home/amir/ProjectsQT/Utility/demo/Demo/res/img/files_11796832.png"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            Clipboard.textSet(placeAddress.text)
                        }
                    }
                }
            }
        }
    }
}
