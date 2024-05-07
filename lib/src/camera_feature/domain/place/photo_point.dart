import 'package:freezed_annotation/freezed_annotation.dart';
part 'photo_point.freezed.dart';
part 'photo_point.g.dart';
/// Represents a photo point, which is a location on an image or map where a photo was taken.
/// 
/// The [PhotoPoint] class contains information about the location of the photo point, including its
/// x and y coordinates, as well as the status of the photo point (e.g. "completed").
/// 
/// The [isCompleted] getter can be used to check if the photo point has been marked as completed.

@freezed
sealed class PhotoPoint with _$PhotoPoint {
  const PhotoPoint._();
  const factory PhotoPoint({
    required num x,
    required num y,
    required String status,
  }) = _PhotoPoint;

  factory PhotoPoint.fromJson(Map<String, dynamic> json) =>
      _$PhotoPointFromJson(json);

  bool get isCompleted => status == 'completed';
}
