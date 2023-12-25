import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: win
    minimumWidth: 280
    width: 300
    height: 480
    visible: true
    title: "Task_for_Login_Page"
    
    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: 30
        spacing: 20
        
        Text {
            text: "Enter your password:"
            font.pixelSize: 16
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 60
        }
        
        Rectangle {
            color: "transparent"
            Layout.preferredWidth: parent.width * 0.8
            Layout.preferredHeight: 10
            Layout.alignment: Qt.AlignCenter
            Layout.bottomMargin: 30
            
            Row {
                spacing: 6
                anchors.centerIn: parent
                Repeater {
                    model: 6
                    Label {
                        width: 20
                        height: 20
                        font.pixelSize: 36
                        text: "*"
                        Layout.alignment: Qt.AlignCenter
                        color: index < passwordField.text.length ? "dim gray" : "light gray"
                    }
                }
            }
        }
        
        GridLayout {
            id: keypad
            columns: 3
            rows: 4
            rowSpacing: 2
            columnSpacing: 2
            Layout.bottomMargin: 30
            
            Repeater {
                model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "Clear", "Log In"]
                Button {
                    text: modelData
                    onClicked: {
                        if (text === "Clear") {
                            passwordField.text = "";
                        }else {
                            passwordField.text += text;
                        }
                    }
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.margins: 2
                    Layout.preferredWidth: (keypad.width - keypad.columnSpacing * (keypad.columns - 1)) / keypad.columns
                    Layout.preferredHeight: (keypad.height - keypad.rowSpacing * (keypad.rows - 1)) / keypad.rows
                }
            }
        }
    }
    
    TextField {
        id: passwordField
        visible: false
    }
}
