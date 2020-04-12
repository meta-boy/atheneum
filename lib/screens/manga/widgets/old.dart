import 'package:atheneum/constants/color.dart';
import 'package:atheneum/models/manga.dart';
import 'package:atheneum/screens/home/widgets/sliver_heading_text.dart';
import 'package:atheneum/screens/home/widgets/sliverdivider.dart';
import 'package:atheneum/screens/reader/reader.dart';
import 'package:flutter/material.dart';

import '../mangascreen.dart';

class OldMangaScreen extends StatefulWidget {
  OldMangaScreen({
    Key key,
    @required this.manga,
    @required this.widget,
  }) : super(key: key);
  final Manga manga;
  final MangaScreen widget;
  @override
  _OldMangaScreenState createState() => _OldMangaScreenState();
}

class _OldMangaScreenState extends State<OldMangaScreen> {
  Image img;
  @override
  void initState() {
    // TODO: implement initState
  img = widget.widget.img == null ? Image.network(widget.manga.img): widget.widget.img;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
      ),
      endDrawer: SafeArea(
          child: Drawer(
        child: Container(
          color: colorBlack,
          child: ListView(
            children: <Widget>[
              Container(
                  color: colorLight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(child: Text("Genre: ")),
                  )),
              Wrap(
                  alignment: WrapAlignment.center,
                  children: widget.manga.genres.map((e) {
                    ColorGenerator cg = ColorGenerator();
                    return InkWell(
                      onTap: () {},
                      splashColor: colorBlue,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Chip(
                            backgroundColor: cg.random,
                            label: Text(
                              e.name,
                              style: TextStyle(color: cg.contrast),
                            ),
                          )),
                    );
                  }).toList()),
              SizedBox(
                height: 30,
              ),
              Container(
                  color: colorLight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(child: Text("Description: ")),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.manga.description,
                  style: TextStyle(color: colorLight),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: img,
                      height: MediaQuery.of(context).size.height * 0.3,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.manga.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: colorLight, fontSize: 20),
                        ),
                        Text(
                           widget.manga.alternative + "\n",
                          style: TextStyle(color: colorLight, fontSize: 10),
                        ),
                        Text(
                           widget.manga.status + "\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: colorLight,
                          ),
                        ),
                        Text(
                           widget.manga.updated,
                          style: TextStyle(
                            color: colorLight,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverDivider(),
          SliverHeadingText(
            text: "Chapters: ",
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: FlatButton(
                    splashColor: colorBlue,
                    color: colorBlack,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Reader(url: widget.manga.chapters[index].url, chapter: widget.manga.chapters[index].name,)));
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.manga.chapters[index].name,
                        style: TextStyle(
                          color: colorLight,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: colorBlue,
                )
              ],
            );
          }, childCount: widget.manga.chapters.length))
        ],
      ),
    );;
  }
}