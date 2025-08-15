#include "Clipboard.h"

Clipboard::Clipboard(QObject * parent) : QObject(parent)
{

}

Clipboard::~Clipboard()
{
}

QString Clipboard::text() const
{
    return m_text;
}

void Clipboard::textSet(const QString &newText)
{
    if (m_text == newText) {
        clipboard->setText(newText);
        return;
    }
    m_text = newText;
    clipboard->setText(m_text);
    emit textChanged();
}
