import 'package:core/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:model/movies/movies_type.dart';

import '../movies_endpoints.dart';

class MoviesApi {
  final NetworkClient _dioClient;

  MoviesApi(this._dioClient);

  Future<Response> getByType(MoviesType type) async {
    try {
      final Response response =
          await _dioClient.get(MoviesEndpoints.getEndpointByType(type));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
