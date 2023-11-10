import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12


Window {
    id:root
    width: 300; height: 510;
    visible: true
    title: qsTr("Layout")
    property int myMargin:7
    ColumnLayout{
        id:page
        spacing: myMargin
        anchors.fill:parent
        Comp{
            id:header
            myText.text: "Header"
            Layout.fillWidth: true
        }
        Comp{
            id:context
            myText.text: "Context"
            color: "white"
            Layout.fillWidth: true
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.fillHeight: true
        }
        
        RowLayout{
            id:buttons
            spacing: 2
            Layout.fillHeight: true
            Comp{
                id:b1
                height:header.height
                Layout.fillWidth: true
                myText.text: "1"
            }
            Comp{
                id:b2
                height:header.height
                Layout.fillWidth: true
                myText.text: "2"
            }
            Comp{
                id:b3
                height:header.height
                Layout.fillWidth: true
                myText.text: "3"
            }
        }
    }
}
