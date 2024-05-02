import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/core/failtures/failures.dart';
import 'package:mad_test_work/core/utils/place_name_filter.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/get_places_use_case.dart';
import 'package:mad_test_work/src/camera_feature/presentation/bloc/places_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'places_list_bloc_test.mocks.dart';

@GenerateMocks([GetPlacesUseCase, PlaceNameFilter])
void main() {
  late MockGetPlacesUseCase mockGetPlacesUseCase;
  late MockPlaceNameFilter placeNameFilter;
  late PlacesListBloc bloc;
  setUp(() {
    mockGetPlacesUseCase = MockGetPlacesUseCase();
    placeNameFilter = MockPlaceNameFilter();
    bloc = PlacesListBloc(
      getPlacesUseCase: mockGetPlacesUseCase,
      placeNameFilter: placeNameFilter,
    );
  });

  group('PlacesListBloc', () {
    test('initial state is Empty', () {
      expect(bloc.state, equals(Empty()));
    });

    test('LoadPlaces calls getPlaces', () async {
      // arrange
      when(mockGetPlacesUseCase.getPlaces())
          .thenAnswer((_) async => Future.value(const Left([])));
      // act
      bloc.add(LoadPlaces());
      await untilCalled(mockGetPlacesUseCase.getPlaces());
      // assert
      verify(mockGetPlacesUseCase.getPlaces()).called(1);
    });

    test('emits [Loading, Loaded] when getPlaces succeeds', () async {
      // arrange
      when(mockGetPlacesUseCase.getPlaces())
          .thenAnswer((_) async => const Left([]));
      // assert later
      final expected = [
        Loading(),
        Loaded(places: const []),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadPlaces());
    });

    test('emits [Loading, Error] when getPlaces fails', () async {
      // arrange
      when(mockGetPlacesUseCase.getPlaces())
          .thenAnswer((_) async => Right(ServerFailure()));
      // assert later
      final expected = [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadPlaces());
    });

    test(
        'doesnt called placeNameFilter.filterPlaces if state is not Loaded or Filtered',
        () async {
      // arrange
      when(placeNameFilter.filteredPlaces(any, any))
          .thenAnswer((_) => List<Place>.empty());

      // act
      bloc.emit(Loading());
      bloc.add(FilterPlaces(''));
      // assert
      verifyNever(placeNameFilter.filteredPlaces(any, any));
    });

    test('called placeNameFilter.filterPlaces if state is Loaded', () async {
      // arrange
      when(placeNameFilter.filteredPlaces(any, any))
          .thenAnswer((_) => List<Place>.empty());

      // act
      bloc.emit(Loaded(places: const []));
      bloc.add(FilterPlaces(''));
      await untilCalled(placeNameFilter.filteredPlaces(any, any));
      // assert
      verify(placeNameFilter.filteredPlaces(any, any)).called(1);
    });

    test('keep original places after filter operations', () async {
      final places = [
        const Place(
            title: 'Place 1', totalPoints: 0, remainingPoints: 0, points: []),
        const Place(
            title: 'Place 2', totalPoints: 0, remainingPoints: 0, points: [])
      ];

      final filteredPlaces = [
        const Place(
            title: 'Place 1', totalPoints: 0, remainingPoints: 0, points: [])
      ];
      // arrange
      when(placeNameFilter.filteredPlaces(any, any))
          .thenAnswer((_) => filteredPlaces);
      final expected = [
        Loaded(places: places),
        Filtered(places: places, filteredPlaces: filteredPlaces),
      ];

      // assert
      expectLater(bloc.stream, emitsInOrder(expected));

      // act
      bloc.emit(Loaded(places: places));
      bloc.add(FilterPlaces('2'));
    });
  });
}
