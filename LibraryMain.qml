import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.LocalStorage 2.12

ApplicationWindow {
    id: app
    width: 800
    height: 640
    visible: true

    LibraryMainItem { anchors.fill: parent}
}
