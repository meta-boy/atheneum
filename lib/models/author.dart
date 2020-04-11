import 'package:atheneum/models/popular.dart';

class Author extends Popular {
  Author({this.url, this.name}) : super(url: url, name: name);
  final String url;
  final String name;
}
