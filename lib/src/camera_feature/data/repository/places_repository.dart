import 'package:dartz/dartz.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
/// Implements the `IPlacesRepository` interface and provides methods to interact with places data sources.
///
/// The `PlacesRepository` class is responsible for fetching places data from both local and remote data sources.
/// It provides a `getPlaces()` method that returns either a list of `PlaceModel` instances or a `Failure` object.
/// If the remote data source is successful, the result is returned as a `Left` value. If an error occurs, a `ServerFailure` is returned as a `Right` value.
/// The implementation also includes a TODO comment to add the ability to fetch data from a local database.

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
      //TODO(me): add an opportunity to get the data from local database
    }
  }
}
