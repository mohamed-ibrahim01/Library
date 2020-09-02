import QtQuick 2.12
import "models"

Item {

    anchors.fill: parent

    property var gItemsArr: []
    property real gTotalMoney: 0

    Logic {
        id: logic
    }

    DataModel {
        id: dataModel
        dispatcher: logic
    }

    LibraryMainPage {}

    Component.onCompleted: {
        logic.initDatabase()
        logic.readData()
    }
    Component.onDestruction: {
        logic.saveData(gItemsArr)
    }
}
