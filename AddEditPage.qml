import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.12

Page {
    property bool isEdit: false
    property int itemIndex
    property var item: gItemsArr[itemIndex]

    title: isEdit? "Edit Item" : "Add Item"

    ScrollView {
        anchors.fill: parent
        anchors.margins: {
            top: 32
            left: 16
            right: 16
        }

        Column {
            anchors.fill: parent
            spacing: 16

            Rectangle {
                width: parent.width
                height: 200
                border.color: "#E9E9E9"
                border.width: 2
                radius: 32

                Image {
                    id: imagePreview
                    anchors.fill: parent
                    anchors.margins: 16
                    fillMode: Image.PreserveAspectFit
                    source: isEdit? item.image : "assets/image.jpg"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: fileDialog.open()
                }
            }

            Rectangle {
                width: parent.width
                border.color: "#E9E9E9"
                border.width: 2
                height: column.height + 32
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 16

                Column {
                    anchors.centerIn: parent
                    id: column
                    width: parent.width - 32
                    spacing: 16

                    TextField {
                        id: tilteField
                        width: parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderText: "Title"
                        text: isEdit? item.title : ""
                    }
                    TextField {
                        id: priceField
                        width: parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderText: "Price"
                        cursorPosition: 0
                        text: isEdit? item.price : ""
                    }

                    Row {
                        height: button.height
                        anchors.right: parent.right
                        spacing: 16

                        Text {
                            id: fileNameText
                            anchors.verticalCenter: parent.verticalCenter
                            Component.onCompleted: {
                                if (isEdit){
                                    var arr = String(item.image).split('/')
                                    text = arr[arr.length-1]
                                }
                                else {
                                    text = "choose image"
                                }
                            }
                        }

                        Button {
                            text: "..."
                            flat: true
                            onClicked: {
                                fileDialog.open()
                            }
                        }
                    }

                    TextField {
                        id: linkField
                        width: parent.width
                        placeholderText: "Link"
                        anchors.horizontalCenter: parent.horizontalCenter
                        Component.onCompleted: ensureVisible(0)
                        text: isEdit? item.link : ""
                    }
                    Button {
                        Material.background: Material.Blue
                        Material.foreground: "#FFF"
                        Material.elevation: 100

                        id: button
                        text: isEdit? "Save" : "Add"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            if (isEdit){
                                var editedItem = {title: tilteField.text
                                    , price: priceField.text
                                    , image: imagePreview.source
                                    , link: linkField.text}

                                logic.editItem(itemIndex, editedItem)
                            }
                            else {
                                var newItem = {title: tilteField.text
                                    , price: priceField.text
                                    , image: imagePreview.source
                                    , link: linkField.text}

                                logic.addItem(newItem)
                            }
                            stackView.pop()
                        }
                    }
                }
            }
        }
    }


    FileDialog {
        id: fileDialog
        title: "Choose Image"
        folder: shortcuts.pictures
        onAccepted: {
            imagePreview.source = fileUrl
            var arr = String(fileUrl).split('/')
            fileNameText.text = arr[arr.length-1]
            fileDialog.close()
        }
    }
}
