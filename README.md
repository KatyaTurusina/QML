# QML_1. Позиционирование элементов
## Задание 1
[My_Rect.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_1/1_task/My_Rect.qml)
```
import QtQuick 2.15

Rectangle{
    width: 100; height: 100
    radius: 7
    color: "light pink"
    border.color: "black"; border.width: 1
}
```
[main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_1/1_task/main.qml)
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
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_1_1.png)
## Задание 2


# QML_2. Layouts
# QML_3. Взаимодействие с пользователем
