import 'package:atheneum/api/genrepage.dart';
import 'package:atheneum/constants/color.dart';
import 'package:atheneum/models/genre.dart';
import 'package:atheneum/screens/manga/mangascreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GenrePage extends StatefulWidget {
  GenrePage({this.genre, this.nextPage, this.currentPageNumber});
  final Genre genre;
  final String nextPage;
  final int currentPageNumber;
  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  GenrePageData genrePageData;

  @override
  void initState() {
    getGenrePage(widget.nextPage != null ? widget.nextPage : widget.genre.url)
        .then((value) {
      setState(() {
        genrePageData = GenrePageData(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        backgroundColor: colorBlack,
        title: Text("${widget.genre.name}"),
        actions: <Widget>[
          Center(
            child: Text("Page ${widget.currentPageNumber} || Next Page"),
          ),
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GenrePage(
                              genre: widget.genre,
                              nextPage: genrePageData.nextPage,
                              currentPageNumber: widget.currentPageNumber + 1,
                            )));
              })
        ],
      ),
      body: genrePageData != null
          ? ListView.builder(
              itemCount: genrePageData.genrePageItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MangaScreen(
                                  img: CachedNetworkImage(
                                    imageUrl:
                                        genrePageData.genrePageItems[index].img,
                                  ),
                                  url: genrePageData.genrePageItems[index].url,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              CachedNetworkImage(
                                  imageUrl:
                                      genrePageData.genrePageItems[index].img,
                                  placeholder: (context, url) => Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.3)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    genrePageData.genrePageItems[index].title,
                                    style: TextStyle(
                                        color: colorLight, fontSize: 18),
                                  ),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      genrePageData.genrePageItems[index].desc
                                              .substring(
                                                  0,
                                                  genrePageData
                                                              .genrePageItems[
                                                                  index]
                                                              .desc
                                                              .length >
                                                          100
                                                      ? 100
                                                      : null) +
                                          "...",
                                      style: TextStyle(color: colorLight),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
