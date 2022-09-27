import '../models/models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '98e73f1bf9e51196a458e7c70cb95524';
  final String _baseURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('Movies Provider initialized');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    String response = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPLayingResponse.fromJson(response);
    print(response);

    print(nowPlayingResponse.dates);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    String response = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(response);

    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies[0]);
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, [int? page = 1]) async {
    var url = Uri.https(
      _baseURL,
      endpoint,
      {
        'api_key': _apiKey,
        'languaje': _language,
        'page': '$page',
      },
    );
    final response = await http.get(url);
    return response.body;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    String response =
        await _getJsonData('3/movie/$movieId/credits', _popularPage);
    final creditsResponse = CreditsResponse.fromJson(response);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
