import 'package:storage_space/storage_space.dart';
/// Retrieves the free space on the device's storage, with an optional unit of measurement.
///
/// This method retrieves the free space on the device's storage and returns it as a [double] value.
/// The optional [uninOfMeauserment] parameter allows specifying the unit of measurement for the returned value,
/// which can be either [UOM.mb] for megabytes or [UOM.gb] for gigabytes. If no unit is specified, the
/// default is [UOM.gb].
///
/// The method first calls [getStorageSpace] to retrieve the [StorageSpace] object, which contains
/// information about the device's storage. It then calculates the free space in gigabytes and
/// rounds the result to the nearest tenth.
///
/// This method is useful for checking the available storage space on the device and taking
/// appropriate actions based on the available space.

class FreeSpaceService {
  Future<double> getFreeSpace([UOM uninOfMeauserment = UOM.gb]) async {
    StorageSpace freeSpace = await getStorageSpace(
      lowOnSpaceThreshold: 2 * 1024 * 1024 * 1024, // Doesnt use 
      fractionDigits: 1, // Actually doestn used
    );
    const handleCeilMultiply = 10;
    // TODO: Handle the case when the free space is less than 1024 * 1024 * 1024 GB
    return (freeSpace.free * handleCeilMultiply / (1024 * 1024 * 1024)).ceil() /
        handleCeilMultiply;
  }
}

enum UOM { mb, gb }
