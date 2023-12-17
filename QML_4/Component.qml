import QtQuick 2.15

Item {
    id:my_delegate
    MyDelegate{
        message:model.message
        time:model.time
        width:parent.width
        height:40
    }
}
