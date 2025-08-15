import QtQuick
import QtQuick.Controls

Button {
    id: btnCopy
    signal clicked
    anchors.right: parent.right
    anchors.rightMargin: 120
    background: Rectangle {
        color: "transparent"
        Image {
            width: 30
            height: 30
            source: "file://home/amir/ProjectsQT/Utility/demo/Demo/res/img/files_11796832.png"
        }
    }
    onClicked: {

    }
}
