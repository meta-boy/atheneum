import 'package:atheneum/api/search.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:floating_search_bar/ui/sliver_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'widgets/item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Widget> widgets = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
        controller: _textEditingController,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        trailing: IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              setState(() {
                widgets = [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ];
              });

              List<SearchResults> results =
                  await search(_textEditingController.text);
              setState(() {
                widgets = results.map((e) {
                  return SearchItem(result: e,);
                }).toList();
              });
            }),
        children: widgets);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
