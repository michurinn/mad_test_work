import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

abstract interface class IPlacesDataSourceRemote {
  Future<List<PlaceModel>> getPlaces();
}
