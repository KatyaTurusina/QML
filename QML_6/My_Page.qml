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
