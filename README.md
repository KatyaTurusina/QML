# QML_1. Позиционирование элементов
## Задание 1
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_1/1_task/main.qml)
```
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    My_Rect{
        id: head
        width: 180
        x:parent.width/2 - head.width/2
        y:parent.height/7
        
        My_Rect{
            id:panel
            color: "black"
            anchors.top: head.top
            anchors.left: head.left
            anchors.right: head.right
            anchors.margins: 10
            anchors.verticalCenter: head.verticalCenter
            
            My_Rect{
                color: "white"
                height:20
                width:20
                anchors.top: panel.top
                anchors.left: panel.left
                //anchors.right: head.right
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.leftMargin: 40
                anchors.verticalCenter: panel.verticalCenter
            }
            My_Rect{
                color: "white"
                height:20
                width:20
                anchors.top: panel.top
                anchors.right: panel.right
                //anchors.right: head.right
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                anchors.rightMargin: 40
                anchors.verticalCenter: panel.verticalCenter
            }
        }
        
        My_Rect{
            id: body
            height: 100
            anchors.top: head.bottom
            anchors.horizontalCenter: head.horizontalCenter
            
            My_Rect{
                id: left_arm
                width: 30
                height: 120
                anchors.right: body.left
                anchors.horizontalCenter: head.horizontalCenter
                transform: Rotation{
                    angle: 10
                    origin.x: left_arm.width/2
                    origin.y: left_arm.height/2
                }
                
            }
            My_Rect{
                id: right_arm
                width: 30
                height: 120
                anchors.left: body.right
                anchors.horizontalCenter: head.horizontalCenter
                transform: Rotation{
                    angle: -10
                    origin.x: left_arm.width/2
                    origin.y: left_arm.height/2
                }
                
            }
            My_Rect{
                id: left_leg
                width: body.width/2
                height: 120
                anchors.top: body.bottom
                anchors.horizontalCenter: head.horizontalCenter/2
                
            }
            My_Rect{
                id: right_leg
                width: body.width/2
                height: 120
                anchors.left: left_leg.right
                anchors.verticalCenter: left_leg.verticalCenter
                
            }
        }
    }
}
```
#### [My_Rect.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_1/1_task/My_Rect.qml)
```
import QtQuick 2.15

Rectangle{
    width: 100; height: 100
    radius: 7
    color: "light pink"
    border.color: "black"; border.width: 1
}
```
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_1_1.png)

## Задание 2
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_1/2_task/main.qml)
```
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
```
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_1_2.png)

# QML_2. Layouts
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_2_Layouts/main.qml)
```
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
```
#### [Comp.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_2_Layouts/Comp.qml)
```
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
```
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_2.png)

# QML_3. Взаимодействие с пользователем
