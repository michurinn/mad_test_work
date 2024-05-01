import 'package:dartz/dartz.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

abstract interface class IPlacesRepository {
  final IPlacesDataSourceLocal placesDataSourceLocal;
  final IPlacesDataSourceRemote placesDataSourceRemote;

  IPlacesRepository({
    required this.placesDataSourceLocal,
    required this.placesDataSourceRemote,
  });

  Future<Either<List<PlaceModel>, Failure>> getPlaces();
}
