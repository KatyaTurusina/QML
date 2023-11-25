import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: textField
    placeholderText: "text"
    font.pixelSize: 14
    background: Rectangle {
        implicitWidth: body.width
        radius: 4
        color: "#fff"
        border.width: 1
        border.color: textField.activeFocus ? "#87CEFA" : "#ddd"
    }
    onFocusChanged: {
            if (focus) {
                textField.focus = true;
            }
        }

}
