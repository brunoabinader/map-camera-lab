import QtQuick 2.0
import QtQuick.Controls 2.3

Column {
    id: column
    width: parent.width

    Text {
        width: parent.width
        text: qsTr("Overall duration: ") + durationSlider.value.toFixed(1) + qsTr("s")
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 12
    }

    Slider {
        id: durationSlider
        width: parent.width
        value: 2.5
        to: 5
    }
}
