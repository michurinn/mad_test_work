import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/photo_point.dart';
part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String title,
    required int totalPoints,
    required int remainingPoints,
    required List<PhotoPoint> points,
  }) = _Place;
}
