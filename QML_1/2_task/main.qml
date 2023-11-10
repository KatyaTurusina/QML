import QtQuick 2.15
import QtQuick.Window 2.15

Window
{
    width: 280; height: 510; visible: true
    title: qsTr("Layout")
    id:win
    Item
    {
        id: root
        anchors.fill: parent
        Rectangle
        {
            id:header
            color: "silver"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right:parent.right
            height:parent.height/10
            Text{
                anchors.centerIn: header
                text: "Header"
            }
            
        }
        Rectangle
        {
            id:context
            border.color: "silver";
            border.width: 1
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.bottom: but1.top
            anchors.margins:6
            Text{
                anchors.centerIn: context
                text: "Context"
            }
        }
        Rectangle
        {
            id:but1
            border.color: "white";
            border.width: 1
            color: "silver"
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: parent.width/3
            height: header.height
            Text{
                anchors.centerIn: but1
                text: "1"
            }
        }
        Rectangle
        {
            id:but2
            border.color: "white";
            border.width: 1
            color: "silver"
            anchors.left: but1.right
            anchors.bottom: parent.bottom
            width: parent.width/3
            height: header.height
            Text{
                anchors.centerIn: but2
                text: "2"
            }
        }
        Rectangle
        {
            id:but3
            border.color: "white";
            border.width: 1
            color: "silver"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: parent.width/3
            height: header.height
            Text{
                anchors.centerIn: but3
                text: "3"
            }
        }
        
    }
}
