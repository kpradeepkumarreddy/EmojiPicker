cmake_minimum_required(VERSION 3.16)

project(EmojiSelector VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appEmojiSelector
    main.cpp
    cachehandler.cpp
    cachehandler.h
)

qt_add_qml_module(appEmojiSelector
    URI EmojiSelector
    VERSION 1.0
    QML_FILES Main.qml EmojiPicker.qml Request.js
)

set_target_properties(appEmojiSelector PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appEmojiSelector
    PRIVATE Qt6::Quick
)

install(TARGETS appEmojiSelector
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
