import 'package:dartz/dartz.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';

class PlacesRepository implements IPlacesRepository {
  @override
  final IPlacesDataSourceLocal placesDataSourceLocal;
  @override
  final IPlacesDataSourceRemote placesDataSourceRemote;

  PlacesRepository({
    required this.placesDataSourceLocal,
    required this.placesDataSourceRemote,
  });

  @override
  Future<Either<List<PlaceModel>,Failure>> getPlaces() async {
    try {
      final result = await  placesDataSourceRemote.getPlaces();
      return Left(result);
    } catch (_) {
      return Right(ServerFailure());
      //TODO(me): add an opportunity to get the data from local datrabase
      //final result = placesDataSourceLocal.getPlaces();
      //return result;
    }
  }
}
