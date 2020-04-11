import 'package:html/dom.dart';

import 'package:atheneum/models/popular.dart';

Future<List<Popular>> getPopulars(List<Element> elements) async {
  List<Popular> populars = [];
  elements.forEach((element) {
    Element slideCaption = element.querySelector('.slide-caption > h3 > a');
    var p = Popular(
        img: element.querySelector('img').attributes['src'],
        url: slideCaption.attributes['href'],
        name: slideCaption.attributes['title']);
    populars.add(p);
  });
  return populars;
}
