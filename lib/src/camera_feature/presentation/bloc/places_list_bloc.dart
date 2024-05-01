// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:mad_test_work/core/utils/place_name_filter.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/get_places_use_case.dart';

part 'places_list_event.dart';
part 'places_list_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class PlacesListBloc extends Bloc<PlacesListEvent, PlacesListState> {
  final PlaceNameFilter placeNameFilter;
  final GetPlacesUseCase getPlacesUseCase;
  PlacesListBloc({
    required this.getPlacesUseCase,
    required this.placeNameFilter,
  }) : super(Empty()) {
    on<PlacesListEvent>((event, emitter) async {
      await switch (event) {
        LoadPlaces() => loadPlaces(event, emitter),
        FilterPlaces() => filterPlaces(event, emitter),
      };
      // ignore: unused_label
      transformer:
      sequential();
    });
  }

  Future<void> loadPlaces(
      LoadPlaces event, Emitter<PlacesListState> emitter) async {
    emitter(Loading());
    final failureOrPlaces = await getPlacesUseCase.getPlaces();
    final state = failureOrPlaces.fold(
        (places) => Loaded(places:places.map((e) => e.place).toList()),
        (failure) => Error(message: SERVER_FAILURE_MESSAGE));
    emitter(state);
  }

  Future<void> filterPlaces(
      FilterPlaces event, Emitter<PlacesListState> emitter) async {
    if (state is Loaded) {
      final sortedPlaces = placeNameFilter.filteredPlaces(
        (state as Loaded).places,
        event.filterString,
      );
      emitter(Loaded(places: sortedPlaces));
    }
  }
}
