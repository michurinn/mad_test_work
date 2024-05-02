import 'package:freezed_annotation/freezed_annotation.dart';
part 'photo_point.freezed.dart';
part 'photo_point.g.dart';

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

// class CheckedPhotoPoint extends PhotoPoint {
//   const CheckedPhotoPoint({
//     required num x,
//     required num y,
//   }) : super(x: x, y: y);
// }

// class UncheckedPhotoPoint extends PhotoPoint {
//   const UncheckedPhotoPoint({
//     required super.x,
//     required super.y,
//   });
// }
