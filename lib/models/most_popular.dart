import 'package:atheneum/models/popular.dart';

class MostPopular extends Popular {
  MostPopular({this.url, this.name}) : super(url: url, name: name);
  final String url;
  final String name;
}
