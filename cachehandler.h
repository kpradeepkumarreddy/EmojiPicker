#ifndef CACHEHANDLER_H
#define CACHEHANDLER_H

#include <QObject>

class CacheHandler : public QObject
{
    Q_OBJECT
public:
    explicit CacheHandler(QObject *parent = nullptr);
    Q_INVOKABLE void write(QString data);
    Q_INVOKABLE QString read();

private:
    QString filePath = "/Users/fyi/Documents/qt-projects/EmojiSelector/cache.txt";
};

#endif // CACHEHANDLER_H
