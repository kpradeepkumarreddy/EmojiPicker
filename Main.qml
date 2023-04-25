import QtQuick
import QtQuick.Window

Window {
    width: 600
    height: screen.height
    visible: true
    title: qsTr("Emoji Selector")

    Text{
        id:selectedEmoji
        anchors{horizontalCenter: parent.horizontalCenter;verticalCenter: parent.verticalCenter}
        text:emojiPicker.selectedEmoji
        font.pointSize: 30
    }

    Rectangle{
        color:"lightgrey"
        anchors { top:selectedEmoji.bottom; bottom:parent.bottom; topMargin: 50; left: parent.left; right:parent.right;}
        EmojiPicker{
            id:emojiPicker;
            anchors{fill:parent; leftMargin: 20; rightMargin: 20; topMargin:10; bottomMargin: 10}
        }
    }
}
