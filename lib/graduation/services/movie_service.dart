import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nomadcoders_flutter_challenge/graduation/models/movie.dart';
import 'package:nomadcoders_flutter_challenge/graduation/models/movie_detail.dart';

class MovieService {
  final _baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  const MovieService();

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await _get('popular');
    return _parseMovies(response.body);
  }

  Future<List<Movie>> fetchNowInCinemasMovies() async {
    final response = await _get('now-playing');
    return _parseMovies(response.body);
  }

  Future<List<Movie>> fetchComingSoonMovies() async {
    final response = await _get('coming-soon');
    return _parseMovies(response.body);
  }

  Future<MovieDetail> fetchMovieDetailById({required int id}) async {
    final response = await _get('movie?id=$id');
    final Map<String, dynamic> responseJson = jsonDecode(response.body);
    return MovieDetail.fromJson(responseJson);
  }

  Future<http.Response> _get(String path) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Error();
    }

    return response;
  }

  List<Movie> _parseMovies(String body) {
    final Map<String, dynamic> responseJson = jsonDecode(body);
    final List<dynamic> results = responseJson['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }
}
