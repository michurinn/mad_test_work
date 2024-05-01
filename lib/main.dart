import 'dart:collection';

import 'package:flutter/material.dart';

import 'src/app.dart';
import 'package:logging/logging.dart' as logging;

void main() async {
  ListQueue<String> debugMessages = ListQueue();
  logging.Logger.root.level = logging.Level.ALL; // defaults to Level.INFO
  logging.Logger.root.onRecord.listen((record) {
    final debugMessagePrint = '[app: ${record.loggerName}] ${record.message}';
    final debugMessageQueue =
        '${record.time} ${record.loggerName}: ${record.message}';
    debugPrint(debugMessagePrint);
    debugMessages.add(debugMessageQueue);
    if (debugMessages.length > 200) {
      debugMessages.removeFirst();
    }
  });
  runApp(const MyApp());
}
