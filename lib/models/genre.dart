import 'package:atheneum/models/popular.dart';

class Genre extends Popular {
  Genre({this.url, this.name}) : super(url: url, name: name);
  final String url;
  final String name;
}
