import 'package:atheneum/api/home.dart';
import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/manga/mangascreen.dart';
import 'package:flutter/material.dart';

import 'sliverdivider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key key,
    @required this.home,
  }) : super(key: key);

  final HomeData home;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            color: colorBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Most Popular Manga:",
                  style: TextStyle(
                      fontSize: 18,
                      color: colorLight,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
          
          return Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MangaScreen(url: home.mostPopular[index].url,)));
                },
                title: Text(
                  home.mostPopular[index].name,
                  style: TextStyle(color: colorLight),
                ),
              ),
              Divider(
                height: 0.5,
                color: colorBlue,
              )
            ],
          );
        }, childCount: home.mostPopular.length)),
        SliverDivider(),
        SliverToBoxAdapter(
          child: Container(
            color: colorBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Genre:",
                  style: TextStyle(
                      fontSize: 18,
                      color: colorLight,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                  alignment: WrapAlignment.center,
                  children: home.genre.map((e) {
                    ColorGenerator cg = ColorGenerator();
                    return InkWell(
                      onTap: () {},
                      splashColor: colorBlue,
                      child: Padding(
                          padding:
                              const EdgeInsets.only(right: 8),
                          child: Chip(
                            backgroundColor: cg.random,
                            label: Text(
                              e.name,
                              style:
                                  TextStyle(color: cg.contrast),
                            ),
                          )),
                    );
                  }).toList()),
            ),
          ),
        )
      ],
    );
  }
}
