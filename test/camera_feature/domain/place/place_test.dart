import 'package:flutter_test/flutter_test.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/photo_point.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

void main() {
  group('Place', () {
    test('fromJson() should return a valid Place instance', () {
      final json = {
        'title': 'Place example',
        'remaining_points': 123,
        'total_points_count': 37,
        'points': [
          {"x": 100, "y": 100, "status": 'incompleted'},
          {"x": 150, "y": 300, "status": 'incompleted'},
          {"x": 120, "y": 400, "status": 'completed'},
        ],
      };

      final place = PlaceModel.fromJson(json);

      expect(place.place.title, 'Place example');
      expect(place.place.remainingPoints, 123);
      expect(place.place.totalPoints, 37);
      expect(place.place.points, [
        const PhotoPoint(x: 100, y: 100, status: 'incompleted'),
        const PhotoPoint(x: 150, y: 300, status: 'incompleted'),
        const PhotoPoint(x: 120, y: 400, status: 'completed'),
      ]);

      expect(place.place.points.first.isCompleted, false);
      expect(place.place.points[2].isCompleted, true);
    });
  });
}
