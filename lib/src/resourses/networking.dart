import 'dart:async';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import '../models/item_model.dart';

class Networking {
  final url =
      'https://api.themoviedb.org/3/search/movie?api_key=4e519b3530c2faf266e5112ee7d353e9&query=%22a&fbclid=IwAR2zoysQ6dI5DTj7VXKcIiPGNgoq9W4btf0_TFSlfz5RfA7nipabb-3U9CA';
  Future<MoviesRootModel> getData() async {
    final Http.Response response = await Http.get(url);

    if (response.statusCode == 200) {
      print('nice');
      return MoviesRootModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      print(response.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
