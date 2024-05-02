import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/photo_point.dart';
part 'place.freezed.dart';

/// A `Place` represents a location with a title, total points, remaining points, and a list of `PhotoPoint`s.
///
/// The `remainingSpace` property calculates the remaining space in the place based on the remaining points.

@freezed
class Place with _$Place {
  const Place._();
  const factory Place({
    required String title,
    required int totalPoints,
    required int remainingPoints,
    required List<PhotoPoint> points,
  }) = _Place;

  double get remainingSpace => remainingPoints * 5;
}
