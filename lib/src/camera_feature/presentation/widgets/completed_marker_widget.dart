import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Displays a completed marker widget, which is a SVG image asset representing a completed task or action.
///
/// The [CompletedMarkerWidget] can be scaled by providing a [scale] parameter, which defaults to 1.0.
/// This widget is typically used to indicate that a certain task or action has been completed within the camera feature of the application.
class CompletedMarkerWidget extends StatelessWidget {
  final double scale;
  const CompletedMarkerWidget({super.key, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/done_marker.svg',
      width: 40.0 * scale,
      height: 40.0 * scale,
    );
  }
}
