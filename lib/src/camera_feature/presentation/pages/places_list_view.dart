import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_test_work/core/extensions/string_exttensions.dart';
import 'package:mad_test_work/src/camera_feature/presentation/bloc/places_list_bloc.dart';
import 'package:mad_test_work/src/camera_feature/presentation/widgets/places_list_tile_widget.dart';
import 'package:mad_test_work/src/free_space/free_space_controller.dart';

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
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Places'.hardcoded),
            ),
            bottom: SearchTextField(),
            floating: true,
            pinned: true,
          )
        ];
      },
      body: Scaffold(
        body: BlocBuilder<PlacesListBloc, PlacesListState>(
          builder: (context, state) {
            return switch (state) {
              Empty() => const Text('Empty'),
              Error() => Text(state.message),
              Loading() => const Center(child: CircularProgressIndicator()),
              Loaded() => ListView.builder(
                  itemCount: state.places.length,
                  itemBuilder: (context, index) => PlacesListTileWidget(
                    place: state.places[index],
                    freeSpaceNotifier: freeSpaceController,
                  ),
                ),
              Filtered() => ListView.builder(
                  itemCount: state.filteredPlaces.length,
                  itemBuilder: (context, index) => PlacesListTileWidget(
                    place: state.filteredPlaces[index],
                    freeSpaceNotifier: freeSpaceController,
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget implements PreferredSizeWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (field) {
        return TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Filter',
          ),
          onChanged: (value) {
            context.read<PlacesListBloc>().add(FilterPlaces(value));
          },
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
