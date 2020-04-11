import 'package:atheneum/models/most_popular.dart';
import 'package:html/dom.dart';

Future<List<MostPopular>> getMostPopular(List<Element> elements) async {
  List<MostPopular> mostPopulars = [];
  elements.forEach((element) {
    var a = element.querySelector('h3 > a');
    var m = MostPopular(url: a.attributes['href'], name: a.attributes['title']);

    mostPopulars.add(m);
  });

  return mostPopulars;
}
