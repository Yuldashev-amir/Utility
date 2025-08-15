#include "app.h"
#include "test.h"
#include "utils.h"
#include "watcher.h"
#include "Clipboard.h"
#include <qqml.h>
#include <qqmlintegration.h>

App::App(int &argc, char *argv[]) : QGuiApplication(argc, argv) {}

App::~App() {}

int App::initApp(int argc, char *argv[]) {

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
      Qt::QueuedConnection);

  QString baseModuleName = "Demo";
  Clipboard * clipboard = new Clipboard;
  // Define order of singletons creation
  engine.singletonInstance<Test *>(baseModuleName, "Test");
  engine.singletonInstance<Watcher *>(baseModuleName, "Watcher");
  engine.singletonInstance<Utils *>(baseModuleName, "Utils");
  qmlRegisterSingletonInstance("Clipboard", 1, 0, "Clipboard", clipboard);
  // Utils mUtils;
  engine.loadFromModule(baseModuleName, "Main");
  return app.exec();
}
