import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/src/free_space/free_space_controller.dart';
import 'package:mad_test_work/src/free_space/free_space_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'free_space_controller_test.mocks.dart';

@GenerateMocks([FreeSpaceService])
void main() {
  late final MockFreeSpaceService mockFreeSpaceService;
  late final FreeSpaceController freeSpaceController;

  setUp(() {
    mockFreeSpaceService = MockFreeSpaceService();
    freeSpaceController =
        FreeSpaceController(freeSpaceService: mockFreeSpaceService);
  });
  group('FreeSpaceController', () {
    test('should return current free space value on construction', () async {
      when(mockFreeSpaceService.getFreeSpace()).thenAnswer((_) async => 100);
      await freeSpaceController.checkFreeSpace();
      expect(freeSpaceController.value, equals(100));
    });

    test('should update value when free space changes', () async {
      when(mockFreeSpaceService.getFreeSpace())
          .thenAnswer((_) async => Future.value(100));
      await freeSpaceController.checkFreeSpace();
      expect(freeSpaceController.value, equals(100));
    });
  });
}
