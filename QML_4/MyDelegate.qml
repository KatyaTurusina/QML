import QtQuick 2.15
import QtQuick.Layouts 1.12

Item {
    id:deleg
    property string message: "?"
    property string time: "?"
    Rectangle{
        id:rect
        border.color:"darkgrey"
        radius:5
        anchors.fill:parent
        anchors.leftMargin: 60
        anchors.topMargin: 15
        
        Row{
            id:row
            anchors.left:parent.left
            anchors.right: parent.right
            anchors.margins: 10
            anchors.fill:parent
            anchors.verticalCenter: rect.verticalCenter
            
            Text{text:message;}
            Text{text:time; anchors.right: row.right}
        }
    }  
}




