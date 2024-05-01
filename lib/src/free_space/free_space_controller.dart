import 'package:flutter/foundation.dart';
import 'package:mad_test_work/src/free_space/free_space_service.dart';

class FreeSpaceController extends ValueNotifier<double> {
  final FreeSpaceService freeSpaceService;
  FreeSpaceController({required this.freeSpaceService, double value = 0})
      : super(value);

  Future<void> checkFreeSpace() async {
    final freeSpace = await freeSpaceService.getFreeSpace();
    value = freeSpace;
  }
}
