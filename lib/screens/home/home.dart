import 'package:atheneum/api/home.dart';
import 'package:atheneum/constants/color.dart';
import 'package:flutter/material.dart';

import 'widgets/mangacard.dart';
import 'widgets/sliver_heading_text.dart';
import 'widgets/sliverdivider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData home = HomeData();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorBlack,
          title: Text("Atheneum"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.category), onPressed: (){})
          ],
        ),
        drawer: SafeArea(
          child: Drawer(),
        ),
        body: FutureBuilder(
          future: home.init(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverHeadingText(
                    text: "Popular Manga: ",
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: home.populars.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                splashColor: colorYellow,
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Card(
                                      child: Image.network(
                                          home.populars[index].img)),
                                ),
                              );
                            },
                          )),
                          Positioned(
                              // right: -1,
                              child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 40,
                              child: FloatingActionButton(
                                backgroundColor: colorLight,
                                foregroundColor: colorBlue,
                                onPressed: () {},
                                child: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SliverDivider(),
                  SliverHeadingText(
                    text: "Latest Updates: ",
                  ),
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return MangaCard(
                            manga: home.latests[index],
                          );
                        },
                        childCount: home.latests.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          childAspectRatio: 225 / 320)),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
