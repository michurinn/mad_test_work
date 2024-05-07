import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/dio_client/dio_client.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixtures_reader.dart';
import 'places_data_source_remote_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late final PlacesDataSourceRemote dataSource;
  late final MockDioClient dioClient;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = PlacesDataSourceRemote(dioClient: dioClient);
  });
  group('PlacesDataSourceRemote', () {
    test('getPlaces throws an exception if status code is not 200', () async {
      // Arrange
      when(dioClient.get(any)).thenAnswer((_) async =>
          Response(statusCode: 400, requestOptions: RequestOptions()));

      // act
      final call = dataSource.getPlaces;

      // assert
      expect(() => call(), throwsA(isA<Exception>()));
    });

    test('getPlaces returns mapped list on success', () async {
      // Arrange
      final Map<String, dynamic> fix = json.decode(fixture('places.json'));
      when(dioClient.get(any)).thenAnswer((_) async => Response(
          statusCode: 200, data: fix, requestOptions: RequestOptions()));

      // Act
      final result = await dataSource.getPlaces();

      // Assert
      expect(result.length, 17);
    });

    test('getPlaces returns empty list', () async {
      // Arrange
      final Map<String, dynamic> fix = {"payload":[]};
      when(dioClient.get(any)).thenAnswer((_) async => Response(
          statusCode: 200, data: fix, requestOptions: RequestOptions()));

      // Act
      final result = await dataSource.getPlaces();

      // Assert
      expect(result.length, 0);
    });
  });
}
