cmake_minimum_required(VERSION 3.16)

project(Demo LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(TARGET_NAME demo)
set(MODULE_NAME Demo)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Qml LinguistTools Network)
find_package(Qt6 REQUIRED COMPONENTS Core)

set(_CPP_SOURCE_FILES)
set(_QML_SOURCES)
set(_QML_SINGLETONS)
set(_IMG_RESOURCES)
set(_FONT_RESOURCES)

add_subdirectory(src)
add_subdirectory(ui)
add_subdirectory(res)

include(CMakePrintHelpers)
cmake_print_variables(_IMG_RESOURCES)

set(LANGS en kk ru)
qt_standard_project_setup(REQUIRES 6.8 I18N_TRANSLATED_LANGUAGES ${LANGS})

qt_add_executable(${TARGET_NAME} ${_CPP_SOURCE_FILES})


target_link_libraries(demo PRIVATE Qt6::Core Qt6::Gui)
set_source_files_properties(${_QML_SINGLETONS} PROPERTIES QT_QML_SINGLETON_TYPE
                                                          TRUE)
qt_add_qml_module(
  ${TARGET_NAME}
  URI
  ${MODULE_NAME}
  IMPORT_PATH
  ${CMAKE_BINARY_DIR}/${MODULE_NAME}
  QML_FILES
  Main.qml
  ${_QML_SOURCES}
  ${_QML_SINGLETONS}
  SOURCES src/config.h src/config.cpp)

qt_add_translations(
  ${TARGET_NAME}
  RESOURCE_PREFIX
  /qt/qml/${MODULE_NAME}/i18n
  TS_FILE_BASE
  qml
  TS_FILE_DIR
  res/i18n
  SOURCES
  Main.qml
  ${_QML_SOURCES})

qt_add_resources(${TARGET_NAME} "Images" BASE res/img FILES ${_IMG_RESOURCES})
qt_add_resources(
  ${TARGET_NAME}
  "Fonts"
  BASE
  res/fonts
  BIG_RESORCES
  FILES
  ${_FONT_RESOURCES})

set_property(TARGET ${TARGET_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON
)# Need by Qt

# Add include directories so target can find the QMLELEMENTS
set(QML_INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Add includepaths
target_include_directories(${TARGET_NAME} PRIVATE ${QML_INCLUDES})

target_link_libraries(${TARGET_NAME} PRIVATE Qt6::Quick Qt6::Network)

include(GNUInstallDirs)
install(
  TARGETS ${TARGET_NAME}
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

add_dependencies(${TARGET_NAME} update_translations)
