import QtQuick 2.12

Item {
    property int totalHeight: 0
    property string title
    property string image
    property string price
    property string link
    signal clicked

    id: root

    Rectangle {
        id:rect
        anchors.fill: parent
        anchors.margins: 8
        radius: 16
        color: "#E0E0E0"

        Image {
            id: imageElement

            anchors {
                left: parent.left
                right: parent.right
                bottom: priceText.top
                margins: 8
            }

            fillMode: Image.PreserveAspectCrop
            height: rect.height - (priceText.height + titleText.height + 8*3 + 16)
            source: root.image
            clip: true
        }

        Text {
            id: priceText

            anchors {
                left: parent.left
                right: parent.right
                bottom: titleText.top
                margins: 8
            }

            text: "$" + root.price
            font.pixelSize: 20
        }

        Text {
            id: titleText
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: 8
                rightMargin: 8
                bottomMargin: 8
            }

            elide: Text.ElideRight
            font.pixelSize: 14
            color: "#424242"
            text: root.title
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
