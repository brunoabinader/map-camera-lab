import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.3
import QtLocation 5.9
import QtPositioning 5.11

Window {
    id: window
    visible: true
    width: 1740
    height: 800
    title: qsTr("Map Camera Lab")

    Row {
        anchors.fill: parent

        Column {
            width: 540

            Text {
                width: parent.width
                text: qsTr("Overall duration: ") + durationSlider.value.toFixed(1) + qsTr("s")
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 12
            }

            Slider {
                id: durationSlider
                width: parent.width
                value: 5
                to: 5
            }

            MapProperty {
                id: coordinate
                width: parent.width
                text: "Coordinate"
                rangeSlider.from: durationSlider.from
                rangeSlider.to: durationSlider.value
                rangeSlider.first.value: durationSlider.from
                rangeSlider.second.value: durationSlider.value
            }

            MapProperty {
                id: zoom
                width: parent.width
                text: "Zoom"
                rangeSlider.from: durationSlider.from
                rangeSlider.to: durationSlider.value
                rangeSlider.first.value: durationSlider.from
                rangeSlider.second.value: durationSlider.value
            }

            MapProperty {
                id: bearing
                width: parent.width
                text: "Bearing"
                rangeSlider.from: durationSlider.from
                rangeSlider.to: durationSlider.value
                rangeSlider.first.value: durationSlider.from
                rangeSlider.second.value: durationSlider.value
            }

            MapProperty {
                id: pitch
                width: parent.width
                text: "Pitch"
                rangeSlider.from: durationSlider.from
                rangeSlider.to: durationSlider.value
                rangeSlider.first.value: durationSlider.from;
                rangeSlider.second.value: durationSlider.value;
            }

            Text {
                width: parent.width
                text: qsTr("Start position")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
            }

            Row {
                width: parent.width
                spacing: 10

                Column {
                    width: 70

                    Text {
                        width: parent.width
                        text: qsTr("Lat: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    TextField {
                        id: startLatitude
                        width: parent.width
                        inputMask: "#00.000"
                        inputMethodHints:  Qt.ImhFormattedNumbersOnly
                        text: startMap.center.latitude;
                        onEditingFinished: startMap.center = QtPositioning.coordinate(startLatitude.text, startLongitude.text);
                    }
                }

                Column {
                    width: 70

                    Text {
                        width: parent.width
                        text: qsTr("Long: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    TextField {
                        id: startLongitude
                        width: parent.width
                        inputMask: "#000.000"
                        inputMethodHints:  Qt.ImhFormattedNumbersOnly
                        text: startMap.center.longitude;
                        onEditingFinished: startMap.center = QtPositioning.coordinate(startLatitude.text, startLongitude.text);
                    }
                }


                Column {
                    width: 120

                    Text {
                        width: parent.width
                        text: qsTr("Zoom: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: startMap.zoomLevel * 10
                        from: startMap.minimumZoomLevel * 10
                        to: startMap.maximumZoomLevel * 10
                        onValueChanged: startMap.zoomLevel = value / 10
                    }
                }

                Column {
                    width: 120

                    Text {
                        width: parent.width
                        text: qsTr("Bearing: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: startMap.bearing * 10
                        from: 0
                        to: 360 * 10
                        onValueChanged: startMap.bearing = value / 10
                    }
                }

                Column {
                    width: 120

                    Text {
                        width: parent.width
                        text: qsTr("Pitch: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: startMap.tilt * 10
                        from: startMap.minimumTilt * 10
                        to: startMap.maximumTilt * 10
                        onValueChanged: startMap.tilt = value / 10
                    }
                }
            }

            Text {
                width: parent.width
                text: qsTr("End position")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
            }

            Row {
                width: parent.width
                spacing: 10

                Column {
                    width: 70

                    Text {
                        width: parent.width
                        text: qsTr("Lat: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    TextField {
                        id: endLatitude
                        width: parent.width
                        inputMask: "#00.000"
                        inputMethodHints:  Qt.ImhFormattedNumbersOnly
                        text: endMap.center.latitude;
                        onEditingFinished: endMap.center = QtPositioning.coordinate(endLatitude.text, endLongitude.text);
                    }
                }

                Column {
                    width: 70

                    Text {
                        width: parent.width
                        text: qsTr("Long: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    TextField {
                        id: endLongitude
                        width: parent.width
                        inputMask: "#000.000"
                        inputMethodHints:  Qt.ImhFormattedNumbersOnly
                        text: endMap.center.longitude;
                        onEditingFinished: endMap.center = QtPositioning.coordinate(endLatitude.text, endLongitude.text);
                    }
                }

                Column {
                    width: 120

                    Text {
                        width: parent.width
                        text: qsTr("Zoom: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: endMap.zoomLevel * 10
                        from: endMap.minimumZoomLevel * 10
                        to: endMap.maximumZoomLevel * 10
                        onValueChanged: endMap.zoomLevel = value / 10
                    }
                }

                Column {
                    width: 120

                    Text {
                        width: parent.width
                        text: qsTr("Bearing: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: endMap.bearing * 10
                        from: 0
                        to: 360 * 10
                        onValueChanged: endMap.bearing = value / 10
                    }
                }

                Column {
                    width: 120
                    Text {
                        width: parent.width
                        text: qsTr("Pitch: ")
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 12
                    }

                    RealSpinBox {
                        value: endMap.tilt * 10
                        from: endMap.minimumTilt * 10
                        to: endMap.maximumTilt * 10
                        onValueChanged: endMap.tilt = value / 10
                    }
                }
            }
        }

        Column {
            width: 400

            Map {
                id: startMap
                width: 400
                height: 400
                plugin: Plugin {
                    name: "mapboxgl"
                }
            }

            Map {
                id: endMap
                width: 400
                height: 400
                plugin: Plugin {
                    name: "mapboxgl"
                }
                center: QtPositioning.coordinate(51.50833, -0.12728)
                zoomLevel: 22.0
                tilt: 60.0
                bearing: -10.0
            }
        }

        Map {
            id: map
            width: 800
            height: parent.height
            plugin: Plugin {
                name: "mapboxgl"
            }
        }
    }

    ParallelAnimation {
        id: animation

        SequentialAnimation {
            PauseAnimation { duration: coordinate.rangeSlider.first.value * 1000 }
            CoordinateAnimation {
                duration: (coordinate.rangeSlider.second.value - coordinate.rangeSlider.first.value) * 1000
                from: startMap.center
                to: endMap.center
                target: map
                property: "center"
                easing.type: coordinate.easing
            }
        }

        SequentialAnimation {
            PauseAnimation { duration: zoom.rangeSlider.first.value * 1000 }
            NumberAnimation {
                duration: (zoom.rangeSlider.second.value - zoom.rangeSlider.first.value) * 1000
                from: startMap.zoomLevel
                to: endMap.zoomLevel
                target: map
                property: "zoomLevel"
                easing.type: zoom.easing
            }
        }

        SequentialAnimation {
            PauseAnimation { duration: pitch.rangeSlider.first.value * 1000 }
            RotationAnimation {
                duration: (pitch.rangeSlider.second.value - pitch.rangeSlider.first.value) * 1000
                from: startMap.tilt
                to: endMap.tilt
                target: map
                property: "tilt"
                easing.type: pitch.easing
                direction: RotationAnimator.Shortest
            }
        }

        SequentialAnimation {
            PauseAnimation { duration: bearing.rangeSlider.first.value * 1000 }
            RotationAnimation {
                duration: (bearing.rangeSlider.second.value - bearing.rangeSlider.first.value) * 1000
                from: startMap.bearing
                to: endMap.bearing
                target: map
                property: "bearing"
                easing.type: bearing.easing
                direction: RotationAnimator.Shortest
            }
        }
    }

    Button {
        id: startButton
        x: 40
        y: 540
        width: 200
        height: 100
        text: qsTr("Start")
        font.pointSize: 20
        onClicked: {
            map.center = startMap.center;
            map.zoomLevel = startMap.zoomLevel;
            map.tilt = startMap.tilt;
            map.bearing = startMap.bearing;
            animation.start();
        }
    }

    Button {
        id: resetButton
        x: 280
        y: 540
        width: 200
        height: 100
        text: qsTr("Reset")
        font.pointSize: 20
        onClicked: {
            map.center = startMap.center;
            map.zoomLevel = startMap.zoomLevel;
            map.tilt = startMap.tilt;
            map.bearing = startMap.bearing;
        }
    }
}
