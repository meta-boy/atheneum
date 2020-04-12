import 'package:html/dom.dart';
import 'package:atheneum/models/genre.dart';

Future<List<Genre>> getGenre(List<Element> elements) async {
  List<Genre> genre = [];
  elements.forEach((element) {
    var m = Genre(
        url: element.querySelector('a').attributes['href'], name: element.text);

    genre.add(m);
  });

  return genre;
}
