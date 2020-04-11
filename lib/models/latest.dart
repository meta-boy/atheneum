import 'package:atheneum/models/popular.dart';

class Latest extends Popular {
  Latest({this.img, this.url, this.name})
      : super(img: img, url: url, name: name);
  final String img;
  final String url;
  final String name;
}
