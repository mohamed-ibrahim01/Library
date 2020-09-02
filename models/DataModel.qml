import QtQuick 2.0

Item {
    property alias dispatcher: logicConnection.target
    //    signal dataReceived()

    Database {
        id: database
    }

    Connections {
        id: logicConnection
        onInitDatabase: {
            database.init()
        }
        onReadData: {
            console.log("TEST (0)")
            database.retrieveData(_.retrieveDataCallback)
        }
        onSaveData: {
            console.log("TEST (1)")
            database.storeData(data)
        }
        onAddItem: {
            gItemsArr.push(item)
            gTotalMoney += parseInt(item.price)

            gItemsArrChanged()
            gTotalMoneyChanged()
        }
        onRemoveItem: {

            var removedItems = gItemsArr.splice(index, 1)
            gTotalMoney -= parseInt(removedItems[0].price)

            gItemsArrChanged()
            gTotalMoneyChanged()
        }
        onEditItem: {

            var oldItem = gItemsArr[index]

            gItemsArr[index] = item
            gTotalMoney = gTotalMoney - parseInt(oldItem.price) + parseInt(item.price)

            gItemsArrChanged()
            gTotalMoneyChanged()
        }
    }

    Item {
        id: _

        function retrieveDataCallback(data){
            gItemsArr = data

            for (var i in gItemsArr){
                gTotalMoney += parseFloat(gItemsArr[i].price)

            }
        }

        function updateTotalMoney() {

        }
    }
}
