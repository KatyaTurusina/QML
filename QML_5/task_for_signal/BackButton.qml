import QtQuick 2.15
import QtQuick.Layouts 1.12

Comp {
    id: backButton
    height: header.height
    anchors.left: parent.left
    myText.text: "←"
    myText.font.pixelSize: 20
    anchors.leftMargin: 30
    opacity: 0
    Rectangle {
        anchors.fill: parent
    }
}
