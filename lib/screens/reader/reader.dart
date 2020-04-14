import 'dart:math';

import 'package:atheneum/constants/color.dart';
import 'package:atheneum/models/chapter.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class Reader extends StatefulWidget {
  Reader({this.url, this.chapter, this.chapterList, this.index});
  final String url, chapter;
  final List<Chapter> chapterList;
  final int index;
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  List<String> imageUrls = [];
  Axis _axis = Axis.vertical;
  Icon _icon = Icon(Icons.stay_current_portrait);
  bool _showAppBar;

  Future<List<String>> getImages() async {
    dom.Document document = await getChapter();
    List<String> imageUrls = [];

    try {
      var e = document.querySelector('.vung-doc');
      var elements = e.querySelectorAll('img');
      elements.forEach((element) {
        imageUrls.add(element.attributes['src']);
      });
    } catch (e) {
      var e = document.querySelector('.container-chapter-reader');
      var elements = e.querySelectorAll('img');
      elements.forEach((element) {
        imageUrls.add(element.attributes['src']);
      });
    }

    return imageUrls;
  }

  Future<dom.Document> getChapter() async {
    http.Response response = await http.get(widget.url);
    dom.Document document = parse(response.body);

    return document;
  }

  @override
  void initState() {
    _showAppBar = true;
    getImages().then((value) {
      setState(() {
        imageUrls = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: !_showAppBar
            ? null
            : AppBar(
                title: Text(
                  widget.chapter,
                  style: TextStyle(fontSize: 14),
                ),
                actions: <Widget>[
                  Tooltip(
                    message: "Previous Chapter",
                    child: IconButton(
                        icon: Transform.rotate(
                          angle: pi,
                          child: Icon(Icons.forward),
                        ),
                        onPressed: widget.index + 1 < widget.chapterList.length
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Reader(
                                              chapter: widget
                                                  .chapterList[widget.index + 1]
                                                  .name,
                                              chapterList: widget.chapterList,
                                              index: widget.index + 1,
                                              url: widget
                                                  .chapterList[widget.index + 1]
                                                  .url,
                                            )));
                              }
                            : null),
                  ),
                  Tooltip(
                    message: "Next Chapter",
                    child: IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: widget.index - 1 >= 0
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Reader(
                                              chapter: widget
                                                  .chapterList[widget.index - 1]
                                                  .name,
                                              chapterList: widget.chapterList,
                                              index: widget.index - 1,
                                              url: widget
                                                  .chapterList[widget.index - 1]
                                                  .url,
                                            )));
                              }
                            : null),
                  ),
                  IconButton(
                      icon: _icon,
                      onPressed: () {
                        setState(() {
                          if (_axis == Axis.vertical) {
                            _axis = Axis.horizontal;
                            _icon = Icon(Icons.stay_current_landscape);
                          } else {
                            _axis = Axis.vertical;
                            _icon = Icon(Icons.stay_current_portrait);
                          }
                        });
                      })
                ],
                backgroundColor: colorBlack,
              ),
        body: imageUrls.isNotEmpty
            ? CustomScrollView(
                scrollDirection: _axis,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                                child: PhotoView(
                              onTapDown: (context, details, controllerValue) {
                                setState(() {
                                  _showAppBar = !_showAppBar;
                                });
                              },
                              imageProvider: NetworkImage(imageUrls[index]),
                              backgroundDecoration:
                                  BoxDecoration(color: colorBlack),
                            )),
                            Positioned(
                                right: -1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text(
                                      "${index + 1} / ${imageUrls.length}",
                                      style: TextStyle(color: colorLight),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    }, childCount: imageUrls.length),
                  )
                ],
              )
            : Center(
                child: Container(),
              ));
  }
}
