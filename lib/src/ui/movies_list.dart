import 'package:flutter/material.dart';
import '../blocs/movies_bloc.dart';
import '../models/item_model.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = MoviesBloc();
    bloc.getAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<MoviesRootModel> snapshot) {
            print('mostafa ${snapshot.data.results}');
            if (snapshot.hasData) {
              print("has data");
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              print('error');
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildList(AsyncSnapshot<MoviesRootModel> snapshot) {
    print('ok');
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            height: 100,
            child: Image.network(
              'https://www.themoviedb.org/t/p/w1280/${snapshot.data.results[index].posterPath}',
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
