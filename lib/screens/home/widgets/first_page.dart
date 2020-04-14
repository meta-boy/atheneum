import 'package:atheneum/api/home.dart';
import 'package:atheneum/constants/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:atheneum/screens/manga/mangascreen.dart';
import 'mangacard.dart';
import 'sliver_heading_text.dart';
import 'sliverdivider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
    @required this.home,
  }) : super(key: key);

  final HomeData home;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverHeadingText(
          text: "New Popular Manga: ",
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MangaScreen(
                                      url: home.populars[index].url,
                                      img: CachedNetworkImage(imageUrl: home.populars[index].img),
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                            child: CachedNetworkImage(imageUrl: home.populars[index].img)),
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
  }
}
