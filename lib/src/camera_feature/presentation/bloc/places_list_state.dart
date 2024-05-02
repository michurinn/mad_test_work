part of 'places_list_bloc.dart';

sealed class PlacesListState extends Equatable {}

final class Empty extends PlacesListState {
  Empty();

  @override
  List<Object?> get props => [];
}

final class Loading extends PlacesListState {
  Loading();

  @override
  List<Object?> get props => [];
}

final class Loaded extends PlacesListState {
  final List<Place> places;

  Loaded({
    required this.places,
  });

  @override
  List<Object?> get props => [places];
}

final class Filtered extends PlacesListState {
  final List<Place> places;
  final List<Place> filteredPlaces;

  Filtered({
    required this.places,
    this.filteredPlaces = const [],
  });

  @override
  List<Object?> get props => [places,filteredPlaces];
}

final class Error extends PlacesListState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
