import 'package:atheneum/models/latest.dart';
import 'package:html/dom.dart';

Future<List<Latest>> getLatest(List<Element> elements) async {
  List<Latest> latest = [];
  elements.forEach((element) {
    var m = Latest(
        img: element.querySelector('img').attributes['src'],
        url: element.querySelector('a').attributes['href'],
        name: element.querySelector('h3 > a').text);
    latest.add(m);
  });

  return latest;
}
