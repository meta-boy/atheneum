import 'package:atheneum/screens/manga/widgets/old.dart';
import 'package:flutter/material.dart';
import 'package:atheneum/models/manga.dart';

import 'widgets/new.dart';

class MangaScreen extends StatefulWidget {
  MangaScreen({this.url, this.img});
  final String url;
  final Image img;
  @override
  _MangaScreenState createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
  Manga manga;
  @override
  void initState() {
    getManga(widget.url).then((value) {
      setState(() {
        manga = Manga(value);
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return manga != null
        ? manga.old
            ? OldMangaScreen(manga: manga, widget: widget)
            : NewMangaScreen(manga: manga, widget: widget)
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
