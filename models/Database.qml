import QtQuick 2.0
import QtQuick.LocalStorage 2.12

Item {
    property var db

    function init() {
        _.initDatabase()
    }

    function storeData(itemsArr){
        _.saveItems(itemsArr)
    }

    function retrieveData(callback){
        _.readDatabase(callback)
    }


    Item {
        id: _

        function initDatabase() {
            db = LocalStorage.openDatabaseSync('Library', '1.0', 'Store library items', 10000)
            db.transaction(function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT, value TEXT)')
            })
        }

        function readDatabase(callback) {
            if (!db)
                return

            db.transaction(function(tx) {
                var result = tx.executeSql('select * from data where name="all_data"')
                result = JSON.parse(result.rows[0].value)
                callback(result)
            })
        }

        function saveItems(itemsArr) {
            if(!db)
                return

            db.transaction( function(tx) {
                var result = tx.executeSql('SELECT * from data where name = "all_data"');

//                result = JSON.parse(result.rows[0].value)
//                var index = result.indexOf(item)
//                if (index !== -1) {

//                }

                if(result.rows.length === 1) {// use update
                    result = tx.executeSql('UPDATE data set value=? where name="all_data"',
                                           [JSON.stringify(itemsArr)]);
                } else { // use insert
                    result = tx.executeSql('INSERT INTO data VALUES (?,?)', ['all_data', JSON.stringify(itemsArr)]);
                }
            });
        }
    }
}
