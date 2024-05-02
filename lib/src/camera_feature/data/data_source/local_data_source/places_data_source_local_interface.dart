import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';


/// Defines the interface for a local data source that provides access to place data.
abstract interface class IPlacesDataSourceLocal {
  /// Retrieves a list of [PlaceModel] instances from the local data source.
  ///
  /// Returns:
  ///   A Future that completes with a list of [PlaceModel] instances.
  Future<List<PlaceModel>> getPlaces();
}
