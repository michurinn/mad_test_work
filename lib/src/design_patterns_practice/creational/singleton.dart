import 'package:flutter/foundation.dart';

class Logger {
  Logger._();

  static final Logger _instance = Logger._();

  static Logger get instance => _instance;
}

void main(){
  final Logger logger = Logger.instance;
  final Logger logger2 = Logger.instance;
  if (kDebugMode) {
    print(identical(logger, logger2));
  } // Output: true
}