import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/src/camera_feature/data/repository/places_repository.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

import 'places_repository_test.mocks.dart';

@GenerateMocks([IPlacesDataSourceLocal, IPlacesDataSourceRemote])
void main() {
  late IPlacesRepository repository;
  late MockIPlacesDataSourceLocal mockLocalDataSource;
  late MockIPlacesDataSourceRemote mockRemoteDataSource;

  setUp(() {
    mockLocalDataSource = MockIPlacesDataSourceLocal();
    mockRemoteDataSource = MockIPlacesDataSourceRemote();

    repository = PlacesRepository(
      placesDataSourceLocal: mockLocalDataSource,
      placesDataSourceRemote: mockRemoteDataSource,
    );
  });

  test('getPlaces returns places from remote data source', () async {
    // Arrange
    final places = [
      const PlaceModel(Place(
          title: 'Place 1', totalPoints: 0, remainingPoints: 0, points: [])),
      const PlaceModel(Place(
          title: 'Place 2', totalPoints: 0, remainingPoints: 0, points: [])),
    ];

    when(mockRemoteDataSource.getPlaces()).thenAnswer((_) async => places);

    // Act
    final result = await repository.getPlaces();

    // Assert
    verify(mockRemoteDataSource.getPlaces()).called(1);
    expect(result, places);
  });

  test('getPlaces returns Failture if remote fails', () async {
    // Arrange

    when(mockRemoteDataSource.getPlaces()).thenThrow(Exception());

    // Act
    final result = await repository.getPlaces();

    // Assert
    verify(mockRemoteDataSource.getPlaces()).called(1);
    expect(result, Right(ServerFailure()));
  });
}
