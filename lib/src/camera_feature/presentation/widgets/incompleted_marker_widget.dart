import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Renders an SVG image representing an incomplete marker.
///
/// This widget is used to display a visual indicator that a task or action is incomplete.
/// The SVG image is loaded from the 'assets/svg/incompleted_marker.svg' asset.

class IncompletedMarkerWidget extends StatelessWidget {
  const IncompletedMarkerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/incompleted_marker.svg',
    );
  }
}
