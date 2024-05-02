import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mad_test_work/core/utils/place_name_filter.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/local_data_source/places_data_source_local_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/dio_client/dio_client.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/data/repository/places_repository.dart';
import 'package:mad_test_work/src/camera_feature/domain/repository/places_repository_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/use_cases/get_places_use_case.dart';
import 'package:mad_test_work/src/camera_feature/presentation/bloc/places_list_bloc.dart';
import 'package:mad_test_work/src/camera_feature/presentation/pages/place_details_view.dart';
import 'package:mad_test_work/src/camera_feature/presentation/pages/places_list_view.dart';
import 'package:mad_test_work/src/error_page.dart';
import 'package:mad_test_work/src/free_space/free_space_controller.dart';
import 'package:mad_test_work/src/free_space/free_space_service.dart';
import 'package:mad_test_work/src/main_page.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // background.
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData.light(),
      initialRoute: MainPageView.routeName,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case PlacesListView.routeName:
                return MultiProvider(
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
                        placesDataSourceLocal:
                            context.read<IPlacesDataSourceLocal>(),
                        placesDataSourceRemote:
                            context.read<IPlacesDataSourceRemote>(),
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
                );
              case PlaceDetailsView.routeName:
                if (routeSettings.arguments is! PageDetailsViewArgs) {
                  return const ErrorPageView();
                }
                final args = routeSettings.arguments as PageDetailsViewArgs;
                return PlaceDetailsView(
                  place: args.place,
                  mockSchemeName: args.mockSchemeName,
                );
              case MainPageView.routeName:
                return const MainPageView();
              default:
                return const ErrorPageView();
            }
          },
        );
      },
    );
  }
}
