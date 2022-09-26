import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: cambiar luego por una instanacia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              SizedBox(
                height: 15,
              ),
              CastingCards(),
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(
            bottom: 15,
          ),
          child: const Text(
            'movie.title',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Movie.originalTitle',
                style: textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.VoteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Text(
        'Excepteur magna ut minim dolore enim laborum ullamco quis ut. Mollit deserunt aliquip anim proident enim elit quis incididunt exercitation do. Anim deserunt reprehenderit minim incididunt laborum eiusmod exercitation aliquip. Enim duis ea commodo commodo do id enim incididunt ipsum culpa pariatur minim et cupidatat. Ut mollit labore id adipisicing nisi laborum exercitation adipisicing excepteur exercitation cupidatat pariatur irure voluptate. Elit incididunt tempor commodo ipsum duis mollit excepteur aute commodo.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
