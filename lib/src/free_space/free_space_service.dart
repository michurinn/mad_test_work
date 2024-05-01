import 'package:storage_space/storage_space.dart';

class FreeSpaceService {
  Future<double> getFreeSpace([UOM uninOfMeauserment = UOM.gb]) async {
    StorageSpace freeSpace = await getStorageSpace(
      lowOnSpaceThreshold: 2 * 1024 * 1024 * 1024, // 2GB
      fractionDigits: 1, // How many digits to use for the human-readable values
    );
    return (freeSpace.free/(1024*1024*1024))..ceilToDouble();
  }
}

enum UOM { mb, gb }
