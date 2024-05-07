import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mad_test_work/core/extensions/string_exttensions.dart';
import 'package:mad_test_work/core/utils/place_name_filter.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/dio_client/dio_client.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/get_places_use_case.dart';
import 'package:mad_test_work/src/camera_feature/presentation/bloc/places_list_bloc.dart';
import 'package:mad_test_work/src/camera_feature/presentation/pages/places_list_view.dart';
import 'package:mad_test_work/src/colors/app_colors.dart';
import 'package:mad_test_work/src/free_space/free_space_controller.dart';
import 'package:mad_test_work/src/free_space/free_space_service.dart';
import 'package:provider/provider.dart';

import 'camera_feature/data/repository/places_repository.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});
  static const routeName = '/main';

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late StreamController<int> _tabIndexController;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    _tabIndexController = StreamController<int>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _tabIndexController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        MultiProvider(
          providers: [
            Provider<DioClient>(
              create: (context) => DioClient(dio: Dio()),
            ),
            Provider<IPlacesDataSourceLocal>(
              create: (context) => PlacesDataSourceLocal(),
            ),
            Provider<IPlacesDataSourceRemote>(
              create: (context) => PlacesDataSourceRemote(
                dioClient: context.read<DioClient>(),
              ),
            ),
            Provider<IPlacesRepository>(
              create: (context) => PlacesRepository(
                placesDataSourceLocal: context.read<IPlacesDataSourceLocal>(),
                placesDataSourceRemote: context.read<IPlacesDataSourceRemote>(),
              ),
            ),
            Provider<GetPlacesUseCase>(
              create: (context) => GetPlacesUseCase(
                placesRepository: context.read<IPlacesRepository>(),
              ),
            ),
          ],
          child: BlocProvider(
            create: (context) => PlacesListBloc(
              getPlacesUseCase: context.read<GetPlacesUseCase>(),
              placeNameFilter: PlaceNameFilter(),
            )..add(LoadPlaces()),
            child: PlacesListView(
              freeSpaceController: FreeSpaceController(
                freeSpaceService: FreeSpaceService(),
              )..checkFreeSpace(),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: StreamBuilder<int>(
          initialData: 0,
          stream: _tabIndexController.stream,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: snapshot.data ?? 0,
              onTap: (value) => _tabIndexController.add(value),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/objects.svg',
                    color: AppColors.customTextSecond,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svg/objects.svg',
                    color: AppColors.menuActive,
                  ),
                  label: 'Объекты'.hardcoded,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/sets.svg',
                    color: AppColors.customTextSecond,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svg/sets.svg',
                    color: AppColors.menuActive,
                  ),
                  label: 'Сеты'.hardcoded,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/profile.svg',
                    color: AppColors.customTextSecond,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/svg/profile.svg',
                    color: AppColors.menuActive,
                  ),
                  label: 'Профиль'.hardcoded,
                ),
              ],
            );
          }),
    );
  }
}
