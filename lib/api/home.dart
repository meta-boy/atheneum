import 'package:atheneum/api/utils/latest.dart';
import 'package:atheneum/api/utils/most_popular.dart';
import 'package:atheneum/api/utils/popular.dart';
import 'package:atheneum/constants/urls.dart';
import 'package:atheneum/models/latest.dart';
import 'package:atheneum/models/most_popular.dart';
import 'package:atheneum/models/popular.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:atheneum/models/genre.dart';
import 'package:atheneum/api/utils/genre.dart';

Future<Document> getHomePage() async {
    http.Response response = await http.get(baseUrl);
    Document document = parse(response.body);

    return document;
  }

class HomeData {
  HomeData (Document document) {
    init(document);

  }
  List<Popular> populars = [];
  List<Latest> latests = [];
  List<MostPopular> mostPopular = [];
  List<Genre> genre = [];

  Future<Map<String, dynamic>> init(Document document) async {
    
    List popularElements = document.querySelectorAll('.owl-carousel > .item');
    List latestElements = document.querySelectorAll('.doreamon > .itemupdate');
    List mpElements = document.querySelectorAll('.xem-nhieu-item');
    List genreElements = document.querySelectorAll('td');
    this.populars = await getPopulars(popularElements);
    this.latests = await getLatest(latestElements);
    this.mostPopular = await getMostPopular(mpElements);
    this.genre = await getGenre(genreElements);

    return {
      "populars": this.populars,
      "latests": this.latests,
      "mostPopular": this.mostPopular
    };
  }

  
}
