import 'package:atheneum/api/search.dart';
import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/manga/mangascreen.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class SearchItem extends StatefulWidget {
  SearchItem({this.result});
  final SearchResults result;
  @override
  _SearchItemState createState() => _SearchItemState();
}

// parse("<h1>${e.name}</h1>").querySelector('h1').text
class _SearchItemState extends State<SearchItem> {
  String name;
  @override
  void initState() {
    name = parse("<h1>${widget.result.name}</h1>").querySelector('h1').text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => MangaScreen(
                    img: Image.network(widget.result.image),
                    url: widget.result.idEncode)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.network(widget.result.image)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name: $name",
                        style: TextStyle(color: colorLight, fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Latest: ${widget.result.lastchapter}",
                        style: TextStyle(color: colorLight),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
