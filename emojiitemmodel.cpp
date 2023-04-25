#include "emojiitemmodel.h"

EmojiItemModel::EmojiItemModel(QObject *parent)
    : QAbstractItemModel(parent)
{
}

QVariant EmojiItemModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

QModelIndex EmojiItemModel::index(int row, int column, const QModelIndex &parent) const
{
    // FIXME: Implement me!
}

QModelIndex EmojiItemModel::parent(const QModelIndex &index) const
{
    // FIXME: Implement me!
}

int EmojiItemModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int EmojiItemModel::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant EmojiItemModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}
