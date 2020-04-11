import 'package:atheneum/models/genre.dart';
import 'package:atheneum/models/author.dart';
import 'package:atheneum/models/chapter.dart';

class Manga {
  final String name;
  final String url;
  final String img;
  final String alternative;
  final List<Author> authors;
  final List<Genre> genres;
  final DateTime updated;
  final String views;
  final double rating;
  final String description;
  final List<Chapter> chapters;

  Manga({this.name, this.url, this.img, this.alternative, this.authors, this.genres, this.updated, this.views, this.rating, this.description, this.chapters});
}