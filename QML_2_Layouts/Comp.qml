import QtQuick 2.15
Rectangle{
    property alias myText: myText
    id:rect1
    height:45
    border.width: 1
    border.color: "light gray"
    color: "light gray"
    Text{
        id: myText
        text: "text"
        anchors.centerIn: rect1
        font.pixelSize: 12
    }
}
