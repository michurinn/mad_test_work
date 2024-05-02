part of 'places_list_bloc.dart';
/// Represents events related to the places list in the camera feature.
///
/// The `PlacesListEvent` class is an abstract base class that defines the
/// common interface for all events related to the places list in the camera
/// feature. Concrete event classes, such as `LoadPlaces` and `FilterPlaces`,
/// inherit from this base class.
///
/// The `LoadPlaces` event is used to indicate that the places list should be
/// loaded from the data source.
///
/// The `FilterPlaces` event is used to indicate that the places list should
/// be filtered based on the provided `filterString`.

sealed class PlacesListEvent {}

final class LoadPlaces extends PlacesListEvent {
  LoadPlaces();
}

final class FilterPlaces extends PlacesListEvent {
  final String filterString;
  FilterPlaces(this.filterString);
}
