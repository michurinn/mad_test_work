part of 'places_list_bloc.dart';

/// Represents the different states of the PlacesList in the application.
///
/// The `PlacesListState` is an abstract class that serves as the base class for all the different states
/// the PlacesList can be in. The concrete subclasses represent the specific states, such as `Empty`,
/// `Loading`, `Loaded`, `Filtered`, and `Error`.
///
/// Clients of the PlacesList can observe the current state and react accordingly, for example by
/// displaying a loading indicator when the state is `Loading`, or rendering a list of places when the
/// state is `Loaded`.

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

// Contain original places for new search operations
final class Filtered extends PlacesListState {
  final List<Place> places;
  final List<Place> filteredPlaces;

  Filtered({
    required this.places,
    this.filteredPlaces = const [],
  });

  @override
  List<Object?> get props => [places, filteredPlaces];
}

final class Error extends PlacesListState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
