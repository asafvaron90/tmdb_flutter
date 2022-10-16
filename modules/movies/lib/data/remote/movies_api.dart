import 'package:core/network/network_client.dart';
import 'package:model/models.dart';
import 'package:movies/data/movies_data_source.dart';

import 'movies_endpoints.dart';

class MoviesApi implements MoviesDataSource {
  final NetworkClient _networkClient;

  MoviesApi(this._networkClient);

  @override
  Future<Map<dynamic, dynamic>> getByType(MoviesType type) async {
    try {
      final response = await _networkClient.get(MoviesEndpoints.fromType(type));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> getMovieDetails(int mId) async {
    try {
      final response = await _networkClient.get(MoviesEndpoints.byId(mId));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
