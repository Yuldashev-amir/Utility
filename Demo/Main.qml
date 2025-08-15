import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Demo

Window {
    id: root
    height: 480
    title: qsTr("Utility")
    visible: true
    width: 640

    Component.onCompleted: Qt.uiLanguage = "ru"

    Column {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
        width: parent.width
        height: parent.height

        TextField {
            id: input
            height: parent.height / 10
            width: parent.width / 3
            text: qsTr("Enter mac-address")
            placeholderText: "mac_addr: d0:9f:d9:41:aa:cb"
            placeholderTextColor: "gray"
            font.pixelSize: parent.width / 37
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: resetBtn
            width: parent.width / 6
            height: parent.height / 10

            anchors.topMargin: 90
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true
            Text {
                text: qsTr("Input")
                color: resetBtn.hovered ? "white" : "black"
                anchors.centerIn: parent
                font.bold: true
                font.pixelSize: root.width / 37
            }
            background: Rectangle {
                color: resetBtn.hovered ? "black" : "white"
                radius: 8
            }

            onClicked: {
                inputRect.macAddress = input.text
                console.log(inputRect.macAddress)
                inputRect.visible = true
                input.clear()
            }
        }
        InputPlace {
            id: inputRect
            width: parent.width
            height: parent.height
            visible: false
            placeAddress: "365.46"
            macAddress: "mac_addr: d0:9f:d9:41:aa:cb"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    TabLanguage {}
}
