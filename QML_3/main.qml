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
            id:content
            myText.text: "Some content"
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
                MouseArea {
                    id:mouse
                    hoverEnabled: true
                    anchors.fill: parent
                    onReleased: {
                        parent.myText.color="black";
                        b2.myText.color="dark gray";
                        b3.myText.color="dark gray";
                        header.myText.text="Header 1";
                        content.color="light yellow";
                        content.myText.text="Item 1 content";
                    }
                    onEntered: {parent.color="dark gray"}
                    onExited: {parent.color="light gray"}
                }
                
            }
            Comp{
                id:b2
                height:header.height
                Layout.fillWidth: true
                myText.text: "2"
                MouseArea {
                    id:mouse2
                    hoverEnabled: true
                    anchors.fill: parent
                    onReleased: {
                        b1.myText.color="dark gray";
                        parent.myText.color="black";
                        b3.myText.color="dark gray";
                        content.color="light pink";
                        header.myText.text="Header 2";
                        content.myText.text="Item 2 content";
                    }
                    onEntered: {parent.color="dark gray"}
                    onExited: {parent.color="light gray"}
                }
            }
            Comp{
                id:b3
                height:header.height
                Layout.fillWidth: true
                myText.text: "3"
                MouseArea {
                    id:mouse3
                    hoverEnabled: true
                    anchors.fill: parent
                    onReleased: {
                        b1.myText.color="dark gray";
                        b2.myText.color="dark gray";
                        parent.myText.color="black";
                        header.myText.text="Header 3";
                        content.color="light blue";
                        content.myText.text="Item 3 content";
                    }
                    onEntered: {parent.color="dark gray"}
                    onExited: {parent.color="light gray"}
                }
            }
        }
    }
}
