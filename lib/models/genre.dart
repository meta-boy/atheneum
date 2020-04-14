import 'package:atheneum/models/popular.dart';




class Genre extends Popular {
  Genre({this.url, this.name}) : super(url: url, name: name);
  final String url;
  final String name;
}

class GenrePageItem {
  final String title;
  final String url;
  final String desc;
  final String img;

  GenrePageItem(this.title, this.url, this.desc, this.img);
  
}
