import 'package:dio/dio.dart';
import 'package:movie_db_app/src/model/serie.dart';
import 'package:movie_db_app/src/model/serieDetail.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://comicvine.gamespot.com/api';
  final String apiKey = 'api_key=b381f398979c82f4e221c53303b9ca3d924689e9';

  Future<List<Serie>> getSeries() async {
    try {
      final url = '$baseUrl/series_list/?$apiKey&format=json';
      final response = await _dio.get(url);
      var Series = response.data['results'] as List;
      List<Serie> serieList = Series.map((s) => Serie.fromJson(s)).toList();
      return serieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<SerieDetails> getSerieDetail(String url) async {
    try {
      final response = await _dio.get('$url?$apiKey&format=json');
      SerieDetails serieDetails = SerieDetails.fromJson(response.data['results']);
      print(serieDetails);
      return serieDetails;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

}
