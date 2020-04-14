import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:atheneum/models/genre.dart';

Future<Document> getGenrePage(String url) async {
  http.Response response = await http.get(url);
  Document document = parse(response.body);

  return document;
}

class GenrePageData {
  GenrePageData(Document document) {
    init(document);
  }
  List<GenrePageItem> genrePageItems = [];
  String nextPage;

  Future<Map<String, dynamic>> init(Document document) async {
    var elements = document.querySelectorAll('.list-truyen-item-wrap');

    elements.forEach((element) {
      this.genrePageItems.add(GenrePageItem(
          element.querySelector('a').attributes['title'],
          element.querySelector('a').attributes['href'],
          element.querySelector('p').text,
          element.querySelector('img').attributes['src']));
    });
    try {
      this.nextPage = document
          .querySelector('.page_blue')
          .nextElementSibling
          .nextElementSibling
          .attributes['href'];
    } catch (e) {
      this.nextPage = null;
    }
    return {
      "genrePage": this.genrePageItems,
    };
  }
}
