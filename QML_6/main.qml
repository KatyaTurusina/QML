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
