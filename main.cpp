#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cacheHandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/EmojiSelector/Main.qml"_qs);

    qmlRegisterType<CacheHandler>("CacheHandler", 1, 0, "CacheHandler");
    qputenv("QML_XHR_ALLOW_FILE_READ", QByteArray("1"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
