import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_test_work/src/camera_feature/presentation/bloc/places_list_bloc.dart';
import 'package:mad_test_work/src/camera_feature/presentation/pages/place_details_view.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/places_list_tile_widget.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/sliver_app_bar.dart';
import 'package:mad_test_work/src/colors/app_colors.dart';
import 'package:mad_test_work/src/free_space/free_space_controller.dart';

/// Builds the places list view, which displays a list of places.
///
/// The [PlacesListView] is a [StatelessWidget] that builds a nested scroll view with a
/// persistent header for the places list. The header contains a search bar that filters
/// the places list. The body of the nested scroll view displays the list of places using
/// a [ListView.separated] widget.
///
/// The [PlacesListView] requires a [FreeSpaceController] to be provided, which is used
/// to update the free space information for each place in the list.

class PlacesListView extends StatelessWidget {
  final FreeSpaceController freeSpaceController;
  const PlacesListView({
    super.key,
    required this.freeSpaceController,
  });
  static const routeName = '/places';
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverSafeArea(
            sliver: SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: PlacesSliverAppBar(
                onChanged: (value) => context.read<PlacesListBloc>().add(
                      FilterPlaces(value),
                    ),
              ),
            ),
          ),
        ];
      },
      body: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<PlacesListBloc, PlacesListState>(
            builder: (context, state) {
              return switch (state) {
                Empty() => const Text('Empty'),
                Error() => Text(state.message),
                Loading() => const Center(child: CircularProgressIndicator()),
                //Displays original data
                Loaded() => ListView.separated(
                    itemCount: state.places.length,
                    itemBuilder: (context, index) => PlacesListTileWidget(
                      place: state.places[index],
                      freeSpaceNotifier: freeSpaceController,
                      onTap: () => Navigator.of(context).pushNamed(
                        PlaceDetailsView.routeName,
                        arguments:
                            PageDetailsViewArgs(place: state.places[index]),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10,
                    ),
                  ),
                // Displays filtered places
                Filtered() => ListView.separated(
                    itemCount: state.filteredPlaces.length,
                    itemBuilder: (context, index) => PlacesListTileWidget(
                      place: state.filteredPlaces[index],
                      freeSpaceNotifier: freeSpaceController,
                      onTap: () => Navigator.of(context).pushNamed(
                        PlaceDetailsView.routeName,
                        arguments: PageDetailsViewArgs(
                            place: state.filteredPlaces[index]),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10,
                    ),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
