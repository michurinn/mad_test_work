import 'package:dartz/dartz.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/use_case_interface.dart';

class GetPlacesUseCase implements UseCase {
  final IPlacesRepository placesRepository;

  GetPlacesUseCase({required this.placesRepository});

  Future<Either<List<PlaceModel>,Failure>> getPlaces() => placesRepository.getPlaces();
}
