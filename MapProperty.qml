import QtQuick 2.0
import QtQuick.Controls 2.3

Column {
    property string text
    property alias rangeSlider: rangeSlider
    property int easing: Easing.Linear

    width: parent.width

    Text {
        id: itemText
        width: parent.width

        text: parent.text + ": " + rangeSlider.first.value.toFixed(1) + " to " + rangeSlider.second.value.toFixed(1)

        horizontalAlignment: Text.AlignLeft
        font.pointSize: 12
    }

    Row {
        width: parent.width

        RangeSlider {
            width: parent.width / 2

            id: rangeSlider
            first.value: 0
        }

        ComboBox {
            textRole: "key"

            model: ListModel {
                id: model
                ListElement { key: "Linear"; value: Easing.Linear }

                ListElement { key: "InQuad"; value: Easing.InQuad }
                ListElement { key: "OutQuad"; value: Easing.OutQuad }
                ListElement { key: "InOutQuad"; value: Easing.InOutQuad }
                ListElement { key: "OutInQuad"; value: Easing.OutInQuad }

                ListElement { key: "InCubic"; value: Easing.InCubic }
                ListElement { key: "OutCubic"; value: Easing.OutCubic }
                ListElement { key: "InOutCubic"; value: Easing.InOutCubic }
                ListElement { key: "OutInCubic"; value: Easing.OutInCubic }

                ListElement { key: "InQuart"; value: Easing.InQuart }
                ListElement { key: "OutQuart"; value: Easing.OutQuart }
                ListElement { key: "InOutQuart"; value: Easing.InOutQuart }
                ListElement { key: "OutInQuart"; value: Easing.OutInQuart }

                ListElement { key: "InQuint"; value: Easing.InQuint }
                ListElement { key: "OutQuint"; value: Easing.OutQuint }
                ListElement { key: "InOutQuint"; value: Easing.InOutQuint }
                ListElement { key: "OutInQuint"; value: Easing.OutInQuint }

                ListElement { key: "InSine"; value: Easing.InSine }
                ListElement { key: "OutSine"; value: Easing.OutSine }
                ListElement { key: "InOutSine"; value: Easing.InOutSine }
                ListElement { key: "OutInSine"; value: Easing.OutInSine }

                ListElement { key: "InExpo"; value: Easing.InExpo }
                ListElement { key: "OutExpo"; value: Easing.OutExpo }
                ListElement { key: "InOutExpo"; value: Easing.InOutExpo }
                ListElement { key: "OutInExpo"; value: Easing.OutInExpo }

                ListElement { key: "InCirc"; value: Easing.InCirc }
                ListElement { key: "OutCirc"; value: Easing.OutCirc }
                ListElement { key: "InOutCirc"; value: Easing.InOutCirc }
                ListElement { key: "OutInCirc"; value: Easing.OutInCirc }

                ListElement { key: "InElastic"; value: Easing.InElastic }
                ListElement { key: "OutElastic"; value: Easing.OutElastic }
                ListElement { key: "InOutElastic"; value: Easing.InOutElastic }
                ListElement { key: "OutInElastic"; value: Easing.OutInElastic }

                ListElement { key: "InBack"; value: Easing.InBack }
                ListElement { key: "OutBack"; value: Easing.OutBack }
                ListElement { key: "InOutBack"; value: Easing.InOutBack }
                ListElement { key: "OutInBack"; value: Easing.OutInBack }

                ListElement { key: "InBounce"; value: Easing.InBounce }
                ListElement { key: "OutBounce"; value: Easing.OutBounce }
                ListElement { key: "InOutBounce"; value: Easing.InOutBounce }
                ListElement { key: "OutInBounce"; value: Easing.OutInBounce }
            }

            onActivated: {
                easing = model.get(currentIndex).value;
            }
        }
    }
}
