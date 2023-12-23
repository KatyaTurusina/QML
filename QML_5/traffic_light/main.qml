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
