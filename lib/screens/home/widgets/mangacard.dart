import 'package:atheneum/constants/color.dart';
import 'package:atheneum/models/popular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:atheneum/screens/manga/mangascreen.dart';

class MangaCard extends StatelessWidget {
  const MangaCard({Key key, @required this.manga, this.height})
      : super(key: key);

  final Popular manga;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: colorYellow,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MangaScreen(
                      url: manga.url,
                      img: CachedNetworkImage(imageUrl: manga.img),
                    )));
      },
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(imageUrl: manga.img,),
                    )),
              ),
              Positioned(
                  bottom: -1,
                  left: -1,
                  right: -1,
                  child: Container(
                    height: 50,
                    color: colorLight.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        manga.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
