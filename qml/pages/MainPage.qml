/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Тестовое приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: mainPage
    allowedOrientations: Orientation.All

    ListModel {
        id: dataModel
        ListElement{name:"ОПЦИЯ1"}
        ListElement{name:"ОПЦИЯ2"}
        ListElement{name:"ОПЦИЯ3"}
        ListElement{name:"ОПЦИЯ4"}
    }

    PageHeader {
        id: pageHeader
        title: qsTr("testTask")
    }

    Component {
        id: delegatId

        Rectangle {
            id: rectangle
            width: container.width/4
            height: Theme.itemSizeSmall
            color: ListView.isCurrentItem ? "deepskyblue" : "white"
            border{
                color: "deepskyblue"
                width: 2
            }

            Label {
                id: textRectangle
                anchors.centerIn: parent
                text: model.name
                color:rectangle.ListView.isCurrentItem ? "white" : "deepskyblue"
                font.pixelSize: Theme.fontSizeMedium
            }
        }

    }

    ListView {
        id: container
        width: mainPage.width - 2*Theme.paddingLarge
        height: mainPage.height - pageHeader.width
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: pageHeader.bottom
        }

        orientation: ListView.Horizontal
        delegate: delegatId
        model: dataModel

        MouseArea {
            id:areaSelectedItem
            anchors.fill: parent
            onClicked: {
                setCurrentItem(mouseX, mouseY)
            }
        }
    }

    function setCurrentItem(x, y){
        container.currentIndex = container.indexAt(x, y)
    }

}

