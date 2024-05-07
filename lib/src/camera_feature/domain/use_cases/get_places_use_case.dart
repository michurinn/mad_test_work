import 'package:dartz/dartz.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/use_case_interface.dart';
/// Retrieves a list of places from the [IPlacesRepository].
///
/// This use case is responsible for fetching the list of places from the
/// repository and returning it as either a successful list of [PlaceModel]
/// instances or a [Failure] if an error occurs during the retrieval process.

class GetPlacesUseCase implements UseCase {
  final IPlacesRepository placesRepository;

  GetPlacesUseCase({required this.placesRepository});

  Future<Either<List<PlaceModel>,Failure>> getPlaces() => placesRepository.getPlaces();
}
