import 'package:flutter/foundation.dart';
import 'package:mad_test_work/src/free_space/free_space_service.dart';
/// Manages the free space value and provides a way to check the current free space.
///
/// The [FreeSpaceController] is a [ValueNotifier] that holds the current free space value.
/// It uses a [FreeSpaceService] to retrieve the free space and updates the value accordingly.
/// Clients can listen to changes in the free space value by listening to this notifier.
class FreeSpaceController extends ValueNotifier<double> {
  /// Creates a new [FreeSpaceController] instance.
  ///
  /// The [freeSpaceService] parameter is required and will be used to retrieve the free space.
  /// The initial [value] can be provided, otherwise it defaults to 0.
  FreeSpaceController({required this.freeSpaceService, double value = 0})
      : super(value);

  /// The [FreeSpaceService] instance used to retrieve the free space.
  final FreeSpaceService freeSpaceService;

  /// Checks the current free space and updates the value accordingly.
  ///
  /// This method calls the [getFreeSpace] method on the [freeSpaceService] and updates the
  /// [value] of this [FreeSpaceController] with the retrieved free space value.
  Future<void> checkFreeSpace() async {
    final freeSpace = await freeSpaceService.getFreeSpace();
    value = freeSpace;
  }
}

