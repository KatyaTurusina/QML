import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 330
    height: 500
    title: "Login Window"

    ColumnLayout {
        id: body
        width: 200
        anchors.centerIn: parent
        spacing: 10

        My_TextField {
            id: loginField
            placeholderText: "login"
        }
        My_TextField {
            id: passwordField
            placeholderText: "password"
            echoMode: TextInput.Password
        }

        RowLayout {
            My_Button {
                text: "Log In"
                buttonColor: "light sky blue"
            }
            My_Button {
                text: "Clear"
                onClicked: {
                    loginField.text = ""
                    passwordField.text = ""
                }
            }
        }
    }
}
