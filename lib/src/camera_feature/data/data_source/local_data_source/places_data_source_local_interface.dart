import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

abstract interface class IPlacesDataSourceLocal {
  Future<List<PlaceModel>> getPlaces();
}
