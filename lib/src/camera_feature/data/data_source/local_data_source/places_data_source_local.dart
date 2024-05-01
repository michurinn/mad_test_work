import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

class PlacesDataSourceLocal implements IPlacesDataSourceLocal{
  @override
  Future<List<PlaceModel>> getPlaces() {
    // TODO: implement getPlaces
    throw UnimplementedError();
  }
  
}