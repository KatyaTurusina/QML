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
