list(APPEND _QML_SOURCES ui/view/Util.qml)
list(APPEND _QML_SOURCES ui/view/InputPlace.qml)
list(APPEND _QML_SOURCES ui/view/TabLanguage.qml)
list(APPEND _QML_SOURCES ui/view/ButtonCopy.qml)
# list(APPEND _QML_SINGLETONS ui/singletons/Fonts.qml
# ui/singletons/UtilsCPP.qml)
list(APPEND _QML_SINGLETONS ui/singletons/Fonts.qml)
set(_QML_SOURCES
    ${_QML_SOURCES}
    PARENT_SCOPE)

set(_QML_SINGLETONS
    ${_QML_SINGLETONS}
    PARENT_SCOPE)
