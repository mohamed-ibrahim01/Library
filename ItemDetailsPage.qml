import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Page {
    property int itemIndex
    property var item: gItemsArr[itemIndex]

    id: root
    title: "Details"

    Rectangle {
        anchors.fill: parent
        anchors.margins: 16
        border.color: "#E9E9E9"
        border.width: 2
        radius: 16

        Column {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 32
            spacing: 16

            Image {
                id: img
                width: parent.width
                height: parent.height / 2

                source: item.image
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        openLinkExternally(linkText.text)
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: 2
                color: "black"
            }

            Grid {
                anchors.left: parent.left
                anchors.leftMargin: 8
                width: parent.width
                height: 120
                columns: 2
                rows: 3
                layoutDirection: Grid.LeftToRight
                rowSpacing: 24
                columnSpacing: 16

                Text {
                    text: "Title :"
                    font.pixelSize: 18
                }
                Text {
                    id: titleText
                    text: item.title
                    height: 40
                    color: "grey"
                    font.pixelSize: 14
                    verticalAlignment: Text.AlignBottom
                }
                Text {
                    font.pixelSize: 18
                    text: "Price :"
                }
                Text {
                    id: priceText
                    height: 40
                    font.pixelSize: 14
                    color: "grey"
                    text: item.price
                    verticalAlignment: Text.AlignBottom
                }
                Text {
                    font.pixelSize: 18
                    text: "Link :"
                }
                Text {
                    id: linkText
                    height: 40
                    width: parent.width / 2
                    elide: Text.ElideRight
                    font.pixelSize: 14
                    color: "blue"
                    text: item.link
                    verticalAlignment: Text.AlignBottom
                    MouseArea {
                        anchors.fill: parent
                        onClicked: openLinkExternally(linkText.text)
                    }
                }
            }
        }
    }


    Column {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 8
        spacing: 8

        RoundButton {
            Material.background: Material.Blue
            Material.foreground: "#FFF"
            Material.elevation: 100
            width: root.width / 6  > 80 ? 80 : root.width / 6
            height: width
            icon.source: "../assets/clear.png"
            onClicked: deleteDialog.open()
        }

        RoundButton {
            Material.background: Material.Blue
            Material.foreground: "#FFF"
            Material.elevation: 100
            width: root.width / 6  > 80 ? 80 : root.width / 6
            height: width
            icon.source: "../assets/edit.png"
            onClicked: {
                stackView.push("AddEditPage.qml", {isEdit: true, itemIndex: itemIndex})
            }
        }
    }

    Dialog {
        Material.background: "#FFF"
        Material.foreground: "#000"
        Material.elevation: 100
        Material.accent: Material.Orange

        id: deleteDialog
        anchors.centerIn: parent
        width: parent.width/2
        standardButtons: Dialog.Ok | Dialog.Cancel
        Label {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            text: "Are you sure?"
            font.pixelSize: 20
        }

        onAccepted: {
            // unbind properties
            img.source = ""
            titleText.text = ""
            priceText.text = ""
            linkText.text = ""

            logic.removeItem(itemIndex)
            stackView.pop()
        }
    }

    function openLinkExternally(link) {
        onClicked: Qt.openUrlExternally(link)
    }
}
