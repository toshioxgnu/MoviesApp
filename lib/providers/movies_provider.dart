import '../models/models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '98e73f1bf9e51196a458e7c70cb95524';
  final String _baseURL = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MOvies Provider initialized');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseURL,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'languaje': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);

    final nowPlayingResponse = NowPLayingResponse.fromJson(response.body);

    print(nowPlayingResponse.results[0].title);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
