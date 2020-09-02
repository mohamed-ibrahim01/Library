import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Page {
    title: "Home"

    GridView {
        id: gridView
        anchors.fill: parent
        visible: isGridView

        cellWidth: width / 2 > 200 ? 200 : width / 2
        cellHeight: cellWidth/* > 200? 200 : cellWidth*/

        model: gItemsArr
        delegate: ItemForm {
            width: gridView.cellWidth
            height: gridView.cellHeight
            price: modelData.price
            title: modelData.title
            image: modelData.image
            onClicked: stackView.push("ItemDetailsPage.qml", {itemIndex: index})
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        visible: !isGridView

        model: gItemsArr
        delegate: ItemForm {
            width: parent.width
            height: width
            price: modelData.price
            title: modelData.title
            image: modelData.image
            onClicked: stackView.push("ItemDetailsPage.qml", {itemIndex: index})
        }
    }

    RoundButton {
        Material.background: Material.Blue
        Material.foreground: "#FFF"
        Material.elevation: 100
        width: parent.width / 6  > 80 ? 80 : parent.width / 6
        height: width
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 8


        icon.source: "../assets/add.png"
        onClicked: {
            stackView.push("AddEditPage.qml", {isEdit: false})
        }
    }
}
