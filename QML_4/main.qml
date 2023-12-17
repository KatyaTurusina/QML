import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 300
    height: 480
    visible: true
    title: qsTr("ListView")
    Rectangle{
        anchors.fill:parent
        gradient:
            Gradient{
            GradientStop{position: 1; color: "#9bbb8c"}
            GradientStop{position: 0; color: "#d2d58b"}
        }
        ListModel{
            id:my_model
        }
        Component{
            id:my_delegate
            MyDelegate{
                message:model.message
                time:model.time
                width:parent.width - 20
                height:50
                
            }
        }
        ListView{
            id:my_list
            anchors.fill:parent
            model:my_model
            delegate:my_delegate
        }
        Row {
            id: inputField
            width: parent.width
            anchors.bottom: parent.bottom
            height: 40
            
            TextField {
                id: messageInput
                width: parent.width - buttonSend.width - 40
                height: parent.height
                placeholderText: "Type a message..."
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 10
            }
            
            Button {
                id: buttonSend
                height: parent.height
                width: parent.width - messageInput.width
                text: "Send"
                onClicked: {
                    my_model.append({message: messageInput.text, time: new Date().getHours() + ":" + new Date().getSeconds()})
                    messageInput.text = ""
                    my_list.positionViewAtEnd()
                }
            }
        }
        
    }
}
