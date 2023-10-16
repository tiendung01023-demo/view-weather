import 'package:dio/dio.dart';
import 'package:flutterapp/models/place_model.dart';

class PlaceRepository {
  Future<List<PlaceModel>> getPlaces({required String search}) async {
    final response = await Dio().get(
      'https://nominatim.openstreetmap.org/search',
      queryParameters: {
        'q': search,
        'format': 'json',
      },
    );
    final data = response.data as List;
    final result = data.map((e) => PlaceModel.fromJson(e)).toList();
    return result;
  }
}
