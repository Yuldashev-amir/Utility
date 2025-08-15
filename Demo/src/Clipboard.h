#ifndef CLIPBOARD_H
#define CLIPBOARD_H

#include <QObject>
#include <QQmlEngine>
#include <QGuiApplication>
#include <QClipboard>
class Clipboard : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString text READ text WRITE textSet NOTIFY textChanged FINAL)
public:
    explicit Clipboard(QObject * parent = nullptr);
    ~Clipboard();

    QString text() const;
    Q_INVOKABLE void textSet(const QString &newText);

signals:
    void textChanged();

private:
    QClipboard * clipboard;
    QString m_text;
};

#endif // CLIPBOARD_H
