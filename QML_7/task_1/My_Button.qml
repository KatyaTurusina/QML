import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: myButton
    text: "text"
    property color buttonColor: "gainsboro"
    background: Rectangle {
        implicitWidth: body.width/2 - 2
        implicitHeight: 30
        color: myButton.buttonColor
        radius: 4
    }
}
