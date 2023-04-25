#include "cachehandler.h"
#include <QTextStream>
#include <QFile>
#include <QDebug>
#include <QByteArray>

CacheHandler::CacheHandler(QObject *parent)
    : QObject{parent}
{

}

void CacheHandler::write(QString data)
{
    QFile caFile(filePath);
    caFile.open(QIODevice::WriteOnly | QIODevice::Text);

    if(!caFile.isOpen()){
        qDebug() << "- Error, unable to open" << "outputFilename" << "for output";
    }
    QTextStream outStream(&caFile);
    outStream << data;
    caFile.close();
}

QString CacheHandler::read()
{
    QFile inFile(filePath);
    inFile.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray data = inFile.readAll();
    return data;
}
