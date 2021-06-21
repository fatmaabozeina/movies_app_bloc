import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import 'package:flutter_appmovie_bloc/src/resourses/networking.dart';

class MoviesBloc {
  final _myNetwork = Networking();
  final _moviesData = PublishSubject<MoviesRootModel>();
  Observable<MoviesRootModel> get allMovies => _moviesData.stream;
  getAllMovies() async {
    print("hhhh");
    MoviesRootModel moviesModel = await _myNetwork.getData();
    print("hamoda ${moviesModel.results}");
    _moviesData.sink.add(moviesModel);
  }

  dispose() {
    _moviesData.close();
  }
}

final bloc = MoviesBloc();
