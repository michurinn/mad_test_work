import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';

class PlaceNameFilter {
  PlaceNameFilter();

  List<Place> filteredPlaces(
      final List<Place> places, final String filterString) {
    return places.where((place) => place.title.contains(filterString)).toList()
      ..sort(
        (a, b) => a.title.indexOf(filterString).compareTo(
              b.title.indexOf(filterString),
            ),
      );
  }
}
