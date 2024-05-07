import 'dart:io';

String fixture(String name) =>
    File('test/camera_feature/fixtures/$name').readAsStringSync();