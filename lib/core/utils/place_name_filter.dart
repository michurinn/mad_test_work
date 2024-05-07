import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';

class PlaceNameFilter {
  PlaceNameFilter();

  List<Place> filteredPlaces(
      final List<Place> places, final String filterString) {
    return places
        .where((place) =>
            place.title.toUpperCase().contains(filterString.toUpperCase()))
        .toList()
      ..sort(
        (a, b) =>
            a.title.toUpperCase().indexOf(filterString.toUpperCase()).compareTo(
                  b.title.toUpperCase().indexOf(filterString.toUpperCase()),
                ),
      );
  }
}
