import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

/// Retrieves the list of places from the local data source.
///
/// This method is responsible for fetching the list of places from the local data source,
/// such as a database or a file. It returns a [Future] that completes with the list of places.
///
/// Returns:
///   A [Future] that completes with the list of [Place] objects retrieved from the local data source.

class PlacesDataSourceLocal implements IPlacesDataSourceLocal {
  @override
  Future<List<PlaceModel>> getPlaces() {
    // TODO: implement getPlaces
    throw UnimplementedError();
  }
}
