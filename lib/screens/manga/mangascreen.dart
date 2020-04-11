import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/home/widgets/sliverdivider.dart';
import 'package:flutter/material.dart';
import 'package:atheneum/models/manga.dart';

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
        print(manga);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return manga != null
        ? Scaffold(
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
                        children: manga.genres.map((e) {
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
                      manga.description,
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
                          Container(child: widget.img, height: MediaQuery.of(context).size.height * 0.3,)
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
                                manga.name,
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(color: colorLight, fontSize: 20),
                              ),
                              Text(
                                manga.alternative + "\n",
                                style:
                                    TextStyle(color: colorLight, fontSize: 10),
                              ),
                              Text(
                                manga.status + "\n",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: colorLight,
                                ),
                              ),
                              Text(
                                manga.updated,
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
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: FlatButton(
                          splashColor: colorBlue,
                          color: colorBlack,
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              manga.chapters[index].name,
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
                }, childCount: manga.chapters.length))
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
