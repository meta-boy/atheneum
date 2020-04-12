import 'package:atheneum/api/home.dart';
import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/search/search.dart';
import 'package:flutter/material.dart';

import 'widgets/first_page.dart';
import 'widgets/second_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData home;
  @override
  void initState() {
    getHomePage().then((document) {
      setState(() {
        home = HomeData(document);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: colorBlack,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: colorBlack,
              title: Text("Atheneum"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
                }),
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
              bottom: TabBar(tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Home"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Miscellaneous"),
                )
              ]),
            ),
            drawer: SafeArea(
              child: Drawer(),
            ),
            body: home != null
                ? TabBarView(
                    children: [FirstPage(home: home), SecondPage(home: home)])
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
