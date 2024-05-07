import 'package:flutter/material.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/completed_marker_widget.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/incompleted_marker_widget.dart';
/// Represents the arguments required to navigate to the [PlaceDetailsView] page.
/// 
/// The [place] parameter is required and represents the [Place] object to be displayed.
/// The [mockSchemeName] parameter is optional and represents the file path to a mock scheme image to be displayed in the view.
class PageDetailsViewArgs {
  final Place place;
  final String mockSchemeName;
  const PageDetailsViewArgs({
    required this.place,
    this.mockSchemeName = 'assets/images/mock_scheme.png',
  });
}

/// Displays the details of a [Place] object, including a mock scheme image and any completed or incomplete markers.
/// 
/// The [place] parameter is required and represents the [Place] object to be displayed.
/// The [mockSchemeName] parameter is required and represents the file path to a mock scheme image to be displayed in the view.

class PlaceDetailsView extends StatelessWidget {
  final Place place;
  final String mockSchemeName;
  const PlaceDetailsView({
    super.key,
    required this.place,
    required this.mockSchemeName,
  });
  static const routeName = '/placeDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InteractiveViewer(
                constrained: false,
                minScale: 0.5,
                maxScale: 20,
                child: Stack(
                  children: [
                    Image.asset(
                      mockSchemeName,
                    ),
                    // Displays the completed and incomplete markers.
                    ...place.points.map(
                      (point) => Positioned(
                          left: double.tryParse(point.x.toString()),
                          bottom: double.tryParse(point.y.toString()),
                          child: point.isCompleted
                              ? const CompletedMarkerWidget()
                              : const IncompletedMarkerWidget()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
