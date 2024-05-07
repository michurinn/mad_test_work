import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/get_places_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_places_use_case_test.mocks.dart';

@GenerateMocks([IPlacesRepository])
void main() {
  late GetPlacesUseCase useCase;
  late MockIPlacesRepository mockPlacesRepository;

  setUp(() {
    mockPlacesRepository = MockIPlacesRepository();
    useCase = GetPlacesUseCase(placesRepository: mockPlacesRepository);
  });

  test('should get places from the repository', () async {
    // arrange
    final places = [
      const PlaceModel(Place(
          title: 'Place 1', totalPoints: 0, remainingPoints: 0, points: [])),
      const PlaceModel(Place(
          title: 'Place 2', totalPoints: 0, remainingPoints: 0, points: [])),
    ];

    when(mockPlacesRepository.getPlaces()).thenAnswer((_) async => Left(places));

    // act
    final result = await useCase.getPlaces();

    // assert
    verify(mockPlacesRepository.getPlaces());
    expect(result, places);
  });

  test('should throw an exception if getting places fails', () async {
    // arrange
    when(mockPlacesRepository.getPlaces()).thenThrow(Exception());

    // act
    final call = useCase.getPlaces;

    // assert
    expect(() => call(), throwsA(isA<Exception>()));
  });
}
