import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en Cines'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //movie slider
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
