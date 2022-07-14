import 'dart:developer';

import 'package:logging/logging.dart';

void initRootLogger() {
  Logger.root.level = Level.ALL;

  hierarchicalLoggingEnabled = true;

  Logger.root.onRecord.listen((record) {
    var start = '\x1b[90m';
    const end = '\x1b[0m';

    switch (record.level.name) {
      case 'INFO':
        start = '\x1b[92m';
        break;
      case 'WARNING':
        start = '\x1b[93m';
        break;
      case 'SEVERE':
        start = '\x1b[91m';
        break;
    }
    final message =
        '$start${record.time}: ${record.level.name}: ${record.message}$end';
    log(message,
        name: record.loggerName.padRight(25),
        level: record.level.value,
        time: record.time);
  });
}
