part of 'places_list_bloc.dart';

sealed class PlacesListEvent {}

final class LoadPlaces extends PlacesListEvent {
  LoadPlaces();
}

final class FilterPlaces extends PlacesListEvent {
  final String filterString;
  FilterPlaces(this.filterString);
}
