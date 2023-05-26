import QtQuick
import QtQuick.Controls
import "Request.js" as XHR
import CacheHandler


Column{
    property string selectedEmoji : ""
    spacing:20
    Row{
        id:row
        spacing:5
        Repeater{
            id:emojiCategoriesRepeater
            property var emojiCategories: []
            model:emojiCategories
            delegate: Rectangle{
                width:50
                height:50
                color:"lightgrey"
                Text{anchors.horizontalCenter: parent.horizontalCenter; font.pointSize: 30; text:modelData}
                Rectangle{
                    id:selectionIndicator
                    anchors{bottom: parent.bottom; left:parent.left; right:parent.right}
                    height:5
                    color:"red"
                    visible: index === listView.index
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        listView.positionViewAtIndex(index, listView.Beginning)
                        listView.index = index
                       // console.log("highlighter clicked, listView.index = "+listView.index+" categoriesIndex = "+index)
                    }
                }
            }
        }
    }

    ListView{
        id:listView
        height: parent.height -row.height
        anchors{ left:parent.left; right:parent.right; topMargin: 10}
        property int index: 0
        property var emojiModel: []
        model:emojiModel
        clip:true
        spacing:25
        boundsBehavior: Flickable.StopAtBounds
        headerPositioning: listView.headerItem.searchText.length > 0 ? ListView.OverlayHeader : ListView.PullBackHeader
        header:Rectangle{
            id:searchBar
            anchors{left:parent.left; right:parent.right}
            property alias searchText:searchInput.text
            height: 45
            z:2
            radius:5
            TextInput{
                id:searchInput
                width: parent.width
                leftPadding: 20
                font.pointSize: 20
                height: 30
                anchors{verticalCenter: parent.verticalCenter}
                cursorVisible: false
                onTextChanged: hint.visible = text.length > 0 ? false : true
            }
            Text{
                id:hint
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 20
                color: "#B6B6B4"
                font.pointSize: 20
                text:"Search Emoji"
            }
        }
        delegate: Column{
            width: ListView.view.width
            spacing: 10
            visible: emojiRepeater.count > 0
            Text{
                font.pointSize: 15
                text: modelData.category
            }
            Flow {
                width: parent.width
                spacing: 10
                Repeater{
                    id: emojiRepeater
                    model:listView.headerItem.searchText.length > 0 ?
                              modelData.emojis.filter(emojiElement => emojiElement.description.includes(listView.headerItem.searchText)) : modelData.emojis
                    Text{
                        font.pointSize: 30
                        text:modelData.emoji
                        MouseArea {
                            anchors.fill: parent
                            onClicked: selectedEmoji = parent.text
                        }
                    }
                }
            }
        }
        onContentYChanged: {
            var listIndex = listView.indexAt(contentX,contentY)
            if(listIndex !== -1){
                index = listIndex
            }
        }
    }

    Component.onCompleted: {
        XHR.sendRequest("EmojiData.json", (resp)=>{
                            emojiCategoriesRepeater.emojiCategories = resp.categories
                            listView.emojiModel = resp.emojis
                        })
    }
}
