import QtQuick 2.0

Item {
    signal initDatabase()
    signal readData()
    signal saveData(var data)
    signal updateTotalMoney()
    signal addItem(var item)
    signal editItem(int index, var item)
    signal removeItem(int index)
}
