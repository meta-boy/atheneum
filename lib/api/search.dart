import 'dart:convert';

import 'package:http/http.dart' as http;



import 'dart:convert';

List<SearchResults> searchResultsFromJson(String str) =>
    List<SearchResults>.from(
        json.decode(str).map((x) => SearchResults.fromJson(x)));

String searchResultsToJson(List<SearchResults> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResults {
  String id;
  String idEncode;
  String name;
  String nameunsigned;
  String lastchapter;
  String image;
  String author;

  SearchResults({
    this.id,
    this.idEncode,
    this.name,
    this.nameunsigned,
    this.lastchapter,
    this.image,
    this.author,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        id: json["id"],
        idEncode: "https://manganelo.com/manga/${json["id_encode"]}",
        name: json["name"],
        nameunsigned: json["nameunsigned"],
        lastchapter: json["lastchapter"],
        image: json["image"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_encode": idEncode,
        "name": name,
        "nameunsigned": nameunsigned,
        "lastchapter": lastchapter,
        "image": image,
        "author": author,
      };
}

Future<List<SearchResults>> search(String keyword) async {
  Map<String, String> body = {"searchword": keyword};
  http.Response response =
      await http.post('https://manganelo.com/getstorysearchjson', body: body);

  final searchResults = searchResultsFromJson(utf8.decode(response.bodyBytes));
  return searchResults;
}
