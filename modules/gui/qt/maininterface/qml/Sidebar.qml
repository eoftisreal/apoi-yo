/*****************************************************************************
 * Copyright (C) 2024 VLC authors and VideoLAN
 *****************************************************************************/

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import VLC.Style
import VLC.Widgets as Widgets
import VLC.Dialogs

Rectangle {
    id: root

    property alias model: navRepeater.model
    property int selectedIndex: 0
    signal itemClicked(int index)

    implicitWidth: VLCStyle.dp(240, VLCStyle.scale)
    color: theme.bg.primary

    ColorContext {
        id: theme
        palette: VLCStyle.palette
        colorSet: ColorContext.View
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: VLCStyle.margin_normal
        spacing: VLCStyle.margin_small

        // Logo Area
        Item {
            Layout.preferredHeight: VLCStyle.dp(60, VLCStyle.scale)
            Layout.fillWidth: true

            Widgets.BannerCone {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                height: VLCStyle.dp(32, VLCStyle.scale)
                width: height
                color: theme.accent
            }

            Widgets.LabelExt {
                anchors.left: parent.left
                anchors.leftMargin: VLCStyle.dp(40, VLCStyle.scale)
                anchors.verticalCenter: parent.verticalCenter
                text: "APOI"
                font.pixelSize: VLCStyle.fontSize_xlarge
                font.weight: Font.Bold
                color: theme.text.primary
            }
        }

        // Navigation Items
        Widgets.NavigableCol {
            id: navCol
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: VLCStyle.margin_xxsmall

            Repeater {
                id: navRepeater
                delegate: Rectangle {
                    id: delegateItem
                    width: parent.width
                    height: VLCStyle.dp(48, VLCStyle.scale)
                    color: (mouseArea.containsMouse || isSelected) ? (isSelected ? "#2A2A2A" : theme.bg.secondary) : "transparent"
                    radius: VLCStyle.dp(8, VLCStyle.scale)

                    readonly property bool isSelected: root.selectedIndex === index

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: VLCStyle.margin_normal
                        anchors.rightMargin: VLCStyle.margin_normal
                        spacing: VLCStyle.margin_normal

                        Widgets.IconLabel {
                            text: model.icon
                            font.pixelSize: VLCStyle.icon_normal
                            color: delegateItem.isSelected ? theme.accent : theme.text.primary
                        }

                        Widgets.LabelExt {
                            text: model.displayText
                            color: delegateItem.isSelected ? theme.accent : theme.text.primary
                            font.pixelSize: VLCStyle.fontSize_normal
                            font.weight: delegateItem.isSelected ? Font.DemiBold : Font.Normal
                            Layout.fillWidth: true
                        }
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: root.itemClicked(index)
                    }
                }
            }

            Item { Layout.fillHeight: true } // Spacer
        }

        // Open Media Button
        Widgets.RoundButtonExt {
            Layout.fillWidth: true
            Layout.preferredHeight: VLCStyle.dp(48, VLCStyle.scale)
            text: qsTr("Open media")
            icon.source: VLCIcons.eject
            icon.color: theme.accent

            // Custom styling to match "Dark background with orange icon"
            background: Rectangle {
                color: "#1E1E1E" // Secondary dark
                radius: VLCStyle.dp(8, VLCStyle.scale)
                border.color: theme.bg.secondary
            }
            contentItem: RowLayout {
                anchors.centerIn: parent
                spacing: VLCStyle.margin_small
                Widgets.IconLabel {
                    text: VLCIcons.eject
                    color: theme.accent
                    font.pixelSize: VLCStyle.icon_normal
                }
                Widgets.LabelExt {
                    text: qsTr("Open media")
                    color: theme.text.primary
                    font.pixelSize: VLCStyle.fontSize_normal
                    font.weight: Font.Medium
                }
            }

            onClicked: DialogsProvider.openFileDialog()
        }
    }

    // Vertical Divider
    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 1
        color: theme.separator
        opacity: 0.1
    }
}
