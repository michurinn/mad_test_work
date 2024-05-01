import 'dart:async';

import 'package:mad_test_work/core/exceptions/exceptions.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/dio_client/dio_client.dart';
import 'package:mad_test_work/src/camera_feature/data/data_source/remote_data_source/places_data_source_remote_interface.dart';
import 'package:mad_test_work/src/camera_feature/domain/place/place_model.dart';

class PlacesDataSourceRemote implements IPlacesDataSourceRemote {
  final DioClient dioClient;

  PlacesDataSourceRemote({required this.dioClient});

  @override
  Future<List<PlaceModel>> getPlaces() async {
    final response = await dioClient.get('/f5628f20.json');
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

// extension type on dynamic {
//   bool get isList => this is List;
// }
