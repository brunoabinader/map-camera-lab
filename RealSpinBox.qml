import QtQuick 2.0
import QtQuick.Controls 2.3


SpinBox {
    width: 120

    editable: true
    inputMethodHints: Qt.ImhFormattedNumbersOnly

    validator: DoubleValidator {
        bottom: Math.min(parent.from, parent.to) * 10
        top:  Math.max(parent.from, parent.to) * 10
    }

    textFromValue: function(value, locale) {
        return Number(value / 10).toLocaleString(locale, 'f', 1);
    }

    valueFromText: function(text, locale) {
        return Number.fromLocaleString(locale, text) * 10;
    }
}
