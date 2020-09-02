import QtQuick 2.12
import QtQuick.Controls 2.12


Item {
    property alias buttonText: button.text
    signal finished

    id: root

    Column {
        anchors.centerIn: parent
        spacing: 16

        TextField {
            id: tilteField
            placeholderText: "Title"
        }
        TextField {
            id: priceField
            placeholderText: "Price"
        }
        TextField {
            id: imageField
            placeholderText: "Image"
        }
        TextField {
            id: linkField
            placeholderText: "Link"
        }
        Button {
            id: button
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("hellllllllo")
            }
        }
    }
}
