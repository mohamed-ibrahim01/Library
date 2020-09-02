import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

Page {
    readonly property real contentPadding: 16
    property bool isGridView: true

    anchors.fill: parent
    header: ToolBar {
        Material.background: Material.Blue
        Material.foreground: "#FFF"
        Material.elevation: 100

        Text {
            id: totalMoneyText
            text: "Total: $" + gTotalMoney
            visible: stackView.depth === 1
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 16
            color: "#FFF"
            font.pixelSize: 22
        }

        ToolButton {
            height: parent.height
            width: parent.height
            Image {
                anchors.fill: parent
                source: "../assets/arrow.png"
            }
            visible: stackView.depth > 1
            onClicked: {
                if (stackView.depth > 1)
                    stackView.pop()
            }
        }

        ToolButton {
            Material.foreground: "#FFF"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 8

            Image {
                anchors.fill: parent
                anchors.margins: 8
                source: isGridView ? "assets/list.png" : "assets/grid.png"
                visible: stackView.depth == 1
            }
            onClicked: {
                isGridView = !isGridView
            }
        }

        Label {
            anchors.centerIn: parent
            text: stackView.currentItem.title
            font.pixelSize: 22
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: HomePage {}
    }
}
