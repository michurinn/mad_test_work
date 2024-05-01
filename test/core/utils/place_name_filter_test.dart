import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/core/utils/place_name_filter.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/photo_point.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';

void main() {
  late PlaceNameFilter filter;
  group('PlaceNameFilter', () {
    setUp(() {
      filter = PlaceNameFilter();
    });

    final places = [
      const Place(
          title: 'Place 1',
          totalPoints: 1,
          points: [PhotoPoint(x: 1, y: 2)],
          remainingPoints: 2),
      const Place(
          title: 'Place 2',
          totalPoints: 1,
          points: [PhotoPoint(x: 1, y: 2)],
          remainingPoints: 2),
    ];

    test('returns empty list when no matches', () {
      expect(
        filter.filteredPlaces(places, 'No Match'),
        isEmpty,
      );
    });

    test('returns matching places in sorted order', () {
      final places = [
        const Place(
            title: 'Place 1',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
        const Place(
            title: 'Place 2',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
        const Place(
            title: 'PlacOther',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
        const Place(
            title: 'PlacAnother',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
      ];

      expect(
        filter.filteredPlaces(places, 'Place'),
        [
          const Place(
              title: 'Place 1',
              totalPoints: 1,
              points: [PhotoPoint(x: 1, y: 2)],
              remainingPoints: 2),
          const Place(
              title: 'Place 2',
              totalPoints: 1,
              points: [PhotoPoint(x: 1, y: 2)],
              remainingPoints: 2),
        ],
      );
    });

    test('sorts matches by index of filter string', () {
      final places = [
        const Place(
            title: 'Place 1',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
        const Place(
            title: 'Place 2',
            totalPoints: 1,
            points: [PhotoPoint(x: 1, y: 2)],
            remainingPoints: 2),
      ];

      expect(
        filter.filteredPlaces(places, 'Place'),
        [
          const Place(
              title: 'Place 1',
              totalPoints: 1,
              points: [PhotoPoint(x: 1, y: 2)],
              remainingPoints: 2),
          const Place(
              title: 'Place 2',
              totalPoints: 1,
              points: [PhotoPoint(x: 1, y: 2)],
              remainingPoints: 2),
        ],
      );
    });
  });
}
