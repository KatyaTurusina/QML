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
#### Результат
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
#### Результат
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
#### Результат
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_2.png)

# QML_3. Взаимодействие с пользователем
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_3/main.qml)
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
```
#### [Comp.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_3/Comp.qml)
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
        color: "black"
    }
}
```
#### Результат
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_3_1.png)
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_3_2.png)
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_3_3.png)

# QML_4. Списки. Модели представления
## Задание "Модель мессенджера"
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_4/main.qml)
```
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
```
#### [MyDelegate.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_4/MyDelegate.qml)
```
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
```
#### [Component.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_4/Component.qml)
```
import QtQuick 2.15

Item {
    id:my_delegate
    MyDelegate{
        message:model.message
        time:model.time
        width:parent.width
        height:40
    }
}
```
#### Результат
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_4_1.png)
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_4_2.png)
![](https://github.com/KatyaTurusina/QML/blob/main/images/qml_4_3.png)

# QML_5. Состояния и переходы
## Задание 1
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_5/traffic_light/main.qml)
```
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Traffic light")
    Rectangle{
        id: rect
        anchors.fill: parent
        Comp{
            id: rect_yellow
            anchors.centerIn: rect
        }
        Comp{
            id: rect_red
            anchors.bottom: rect_yellow.top
            color: "red"
            
        }
        Comp{
            id: rect_green
            anchors.top: rect_yellow.bottom
            color: "green"
            
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                if (parent.state === "stop") {
                    parent.state = "caution";
                } else if (parent.state === "caution") {
                    parent.state = "go";
                } else {
                    parent.state = "stop";
                }
            }
        }
        states:[
            State {
                name: "stop"
                PropertyChanges {target: rect_red; color: "red"}
                PropertyChanges {target:rect_yellow; color: "black"}
                PropertyChanges {target:rect_green; color: "black"}
            },
            State {
                name: "caution"
                PropertyChanges {target: rect_red; color: "black"}
                PropertyChanges {target:rect_yellow; color: "yellow"}
                PropertyChanges {target:rect_green; color: "black"}
            },
            State {
                name: "go"
                PropertyChanges {target: rect_red; color: "black"}
                PropertyChanges {target:rect_yellow; color: "black"}
                PropertyChanges {target:rect_green; color: "green"}
            } ]
        state:"stop"
        transitions: [
            Transition {
                from: "stop"
                to: "caution"
                ColorAnimation {
                    target: rect_yellow
                    duration: 500
                }
            },
            Transition {
                from: "caution"
                to: "go"
                ColorAnimation {
                    target: rect_green
                    duration: 500
                }
            },
            Transition {
                from: "go"
                to: "stop"
                ColorAnimation {
                    target: rect_red
                    duration: 500
                }
            }
        ]
    }
}
```
#### [Сomp.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_5/traffic_light/Comp.qml)
```
import QtQuick 2.15

Rectangle{
    width: 100; height: 100
    radius: 50
    color: "yellow"
    border.color: "black";
    border.width: 1
    anchors.topMargin: 5
    anchors.bottomMargin: 5
    anchors.horizontalCenter: rect.horizontalCenter
}
```
#### Результат (gif)
![1217-_1_](https://github.com/KatyaTurusina/QML/assets/130843083/6dda81e8-639a-4c1d-8413-9cceb0c756a4)
## Задание 2
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_5/task_for_signal/main.qml)
```
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

Window {
    id: root
    width: 300
    height: 510
    visible: true
    title: qsTr("Layout")
    property int myMargin: 7

    ColumnLayout {
        id: page
        spacing: myMargin
        anchors.fill: parent


        Comp {
            id: header
            myText.text: "Header"
            Layout.fillWidth: true
            BackButton{
                id: backButton
            }
        }

        Comp {
            id: content
            myText.text: "Some content"
            color: "white"
            Layout.fillWidth: true
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.fillHeight: true
        }

        RowLayout {
            id: buttons
            spacing: 2
            Layout.fillHeight: true

            Comp {
                id: b1
                height: header.height
                Layout.fillWidth: true
                myText.text: "1"
                MouseArea{
                    anchors.fill:parent
                    onClicked: { buttons.state = "button1State"}
                }

            }

            Comp {
                id: b2
                height: header.height
                Layout.fillWidth: true
                myText.text: "2"
                MouseArea{
                    anchors.fill:parent
                    onClicked: { buttons.state = "button2State"}
                }
            }

            Comp {
                id: b3
                height: header.height
                Layout.fillWidth: true
                myText.text: "3"
                MouseArea{
                    anchors.fill:parent
                    onClicked: { buttons.state = "button3State"}
                }
            }
            states: [
                State {
                    name: "button1State"
                    when: b1.clicked
                    PropertyChanges { target: b1; opacity: 1}
                    PropertyChanges { target: b2; opacity: 0.5}
                    PropertyChanges { target: b3; opacity: 0.5}
                    PropertyChanges { target: header; myText.text: "Header 1" }
                    PropertyChanges { target: content; myText.text: "Item 1 content" }
                    PropertyChanges { target: backButton; opacity: 0}
                },
                State {
                    name: "button2State"
                    when: b2.clicked
                    PropertyChanges { target: b1; opacity: 0.5}
                    PropertyChanges { target: b2; opacity: 1}
                    PropertyChanges { target: b3; opacity: 0.5}
                    PropertyChanges { target: header; myText.text: "Header 2" }
                    PropertyChanges { target: content; myText.text: "Item 2 content" }
                    PropertyChanges { target: backButton; opacity: 1}
                },
                State {
                    name: "button3State"
                    when: b3.clicked
                    PropertyChanges { target: b1; opacity: 0.5}
                    PropertyChanges { target: b2; opacity: 0.5}
                    PropertyChanges { target: b3; opacity: 1}
                    PropertyChanges { target: header; myText.text: "Header 3" }
                    PropertyChanges { target: content; myText.text: "Item 3 content" }
                    PropertyChanges { target: backButton; opacity: 1}
                }
            ]
            transitions: [
                Transition {
                    from: "button1State"
                    to: "button2State"
                    PropertyAnimation  {
                        target: b1
                        property: "opacity"
                        duration: 500
                    }
                },
                Transition {
                    from: "button1State"
                    to: "button3State"
                    PropertyAnimation  {
                        target: b1
                        property: "opacity"
                        duration: 300
                    }
                },
                Transition {
                    from: "button2State"
                    to: "button1State"
                    PropertyAnimation  {
                        target: b2
                        property: "opacity"
                        duration: 300
                    }
                },
                Transition {
                    from: "button2State"
                    to: "button3State"
                    PropertyAnimation  {
                        target: b2
                        property: "opacity"
                        duration: 300
                    }
                },
                Transition {
                    from: "button3State"
                    to: "button1State"
                    PropertyAnimation  {
                        target: b3
                        property: "opacity"
                        duration: 300
                    }
                },
                Transition {
                    from: "button3State"
                    to: "button2State"
                    PropertyAnimation  {
                        target: b3
                        property: "opacity"
                        duration: 300
                    }
                }
            ]
        }
    }
}
```
#### [Comp.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_5/task_for_signal/Comp.qml)
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
        color: "black"
    }
}
```
#### [BackButton.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_5/task_for_signal/BackButton.qml)
```
import QtQuick 2.15
import QtQuick.Layouts 1.12

Comp {
    id: backButton
    height: header.height
    anchors.left: parent.left
    myText.text: "←"
    myText.font.pixelSize: 20
    anchors.leftMargin: 30
    opacity: 0
    Rectangle {
        anchors.fill: parent
    }
}
```
#### Результат (gif)
![1223](https://github.com/KatyaTurusina/QML/assets/130843083/9ad252de-771a-400e-a142-91080a297b36)

# QML_6. Stack View
## Задание "Светофор"
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_6/main.qml)
```
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: 360
    height: 640
    visible: true
    title: qsTr("StackView_test")
    
    header: ToolBar {
        id: page_header
        height: 40
        RowLayout {
            ToolButton {
                id: back_btn
                text: "< Back"
                font.pixelSize: 20
                visible: stack_view.depth > 1
                anchors.verticalCenter: parent.verticalCenter
                onClicked: stack_view.pop()
            }
            Text {
                id: header_page_text
                text: stack_view.currentItem ? stack_view.currentItem.btext : ""
                anchors.centerIn: parent
            }
        }
    }
    
    StackView {
        id: stack_view
        anchors.fill: parent
        initialItem: page_red
    }
    
    My_Page {
        id: page_red
        bg: "red"
        btext1: "To_Green"
        btext2: "To_Yellow"
    }
    
    My_Page {
        id: page_green
        bg: "green"
        btext1: "To_Yellow"
        btext2: "To_Red"
        visible: false
    }
    
    My_Page {
        id: page_yellow
        bg: "yellow"
        btext1: "To_Red"
        btext2: "To_Green"
        visible: false
    }
}
```
#### [My_Page.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_6/My_Page.qml)
```
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    property string bg: "white"
    property string btext1: ""
    property string btext2: ""
    
    Rectangle {
        anchors.fill: parent
        color: bg
        width: 100
        
        ColumnLayout {
            anchors.fill: parent
            
            Button {
                text: btext1
                Layout.fillWidth: true
                onClicked: buttonClicked1()
            }
            
            Button {
                text: btext2
                Layout.fillWidth: true
                onClicked: buttonClicked2()
            }
        }
    }
    
    function buttonClicked1() {
        if (btext1 === "To_Green") {
            page_green.visible = true
            page_yellow.visible = false
            page_red.visible = false
            stack_view.push(page_green)
        } else if (btext1 === "To_Yellow") {
            page_green.visible = false
            page_yellow.visible = true
            page_red.visible = false
            stack_view.pop(page_yellow)
        } else if (btext1 === "To_Red") {
            page_green.visible = false
            page_yellow.visible = false
            page_red.visible = true
            stack_view.pop(page_red)
        }
    }
    
    function buttonClicked2() {
        if (btext2 === "To_Green") {
            page_green.visible = true
            page_yellow.visible = false
            page_red.visible = false
            stack_view.push(page_green)
        } else if (btext2 === "To_Yellow") {
            page_green.visible = false
            page_yellow.visible = true
            page_red.visible = false
            stack_view.push(page_yellow)
        } else if (btext2 === "To_Red") {
            page_green.visible = false
            page_yellow.visible = false
            page_red.visible = true
            stack_view.pop(page_red)
        }
    }
}
```
#### Результат
![stack_view](https://github.com/KatyaTurusina/QML/assets/130843083/99cbcf6d-b3c4-4d08-b838-ef47d48c95f3)

# QML_7. Стандартные элементы интерфейса
## Задание 1
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_7/task_1/main.qml)
```
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
```
#### [My_TextField.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_7/task_1/My_TextField.qml)
```
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
```
#### [My_Button.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_7/task_1/My_Button.qml)
```
import QtQuick 2.12
import QtQuick.Controls 2.12
Button {
    id: myButton
    text: "text"
    property color buttonColor: "gainsboro"
    background: Rectangle {
        implicitWidth: body.width/2 - 2
        implicitHeight: 30
        color: myButton.buttonColor
        radius: 4
    }
}
```
#### Результат
![1225](https://github.com/KatyaTurusina/QML/assets/130843083/318bde96-7870-47c7-a9da-859c3d0332b7)

## Задание 2
#### [main.qml](https://github.com/KatyaTurusina/QML/blob/main/QML_7/task_2/main.qml)
```
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
```
#### Результат
![Task_for_Login_Page-2023-12-25-17-47-41](https://github.com/KatyaTurusina/QML/assets/130843083/1a5fed5f-c0ca-4b6e-b6cb-1e6eda6790e6)



