import 'package:atheneum/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class Reader extends StatefulWidget {
  Reader({this.url, this.chapter});
  final String url, chapter;
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  List<String> imageUrls = [];

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
      
      var e =
          document.querySelector('.container-chapter-reader');
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
    getImages().then((value) {
      setState(() {
        imageUrls = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    print(widget.url);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.chapter),
          backgroundColor: colorBlack,
        ),
        body: imageUrls.isNotEmpty
            ? CustomScrollView(
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
