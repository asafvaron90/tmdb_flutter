import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  static const String _tmdbBaseUrl = "https://api.themoviedb.org/3/";
  static const String _tmdbApiKeyV4 =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OWU0OWUzODg3ZWE0ZWU1NDY1ZTFjNjhhOGNhNmJmMCIsInN1YiI6IjU4NjIyYzgzYzNhMzY4MWE3ZDAzOWQ2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nL8_22Gn19SOJJocosQea2Y2UobbKF9jb5HRHwAiN-0";
  static const String _tmdbApiKeyV3 = "99e49e3887ea4ee5465e1c68a8ca6bf0";
  // dio instance
  late Dio _dio;

  Future<NetworkClient> init() async {
    _dio = Dio();
    _dio
      ..options.baseUrl = _tmdbBaseUrl
      ..options.headers = {
        "Authorization": 'Bearer $_tmdbApiKeyV4',
      }
      // ..options.queryParameters = {"api_key": _tmdbApiKeyV3}
      ..options.responseType = ResponseType.json;
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return this;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
