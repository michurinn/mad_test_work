import 'dart:async';

import 'package:mad_test_work/core/exceptions/exceptions.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/dio_client/dio_client.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

/// Implements the [IPlacesDataSourceRemote] interface to fetch place data from a remote source.
///
/// The [PlacesDataSourceRemote] class uses the [DioClient] to make a GET request to the specified URL and
/// parse the response data into a list of [PlaceModel] instances.
///
/// If the response status code is 200 (OK), the method returns the list of [PlaceModel] instances.
/// If the response status code is not 200, the method throws a [ServerException].

class PlacesDataSourceRemote implements IPlacesDataSourceRemote {
  final DioClient dioClient;

  PlacesDataSourceRemote({required this.dioClient});

  @override
  Future<List<PlaceModel>> getPlaces() async {
    final response =
        await dioClient.get('https://json-parser.com/f5628f20/4.json');
    final Completer<List<PlaceModel>> completer = Completer<List<PlaceModel>>();
    // TODO(me): add check for status code here
    if (response.statusCode == 200) {
      final List<dynamic> payload = response.data['payload'] ?? [];
      final result = payload.map((e) => PlaceModel.fromJson(e)).toList();
      completer.complete(result);
    } else {
      completer.completeError(ServerException());
    }
    return completer.future;
  }
}
