import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/home/home.dart';
import 'package:flutter/material.dart';

class LicenseApp extends StatefulWidget {
  @override
  _LicenseAppState createState() => _LicenseAppState();
}

class _LicenseAppState extends State<LicenseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2,
              child: Text(
                "Disclaimer:\nAll information / media used in this app belongs to their original creator, no responsibility is taken by the creator of the app as this is purely educational and non-profit application.\nConsumers have been warned.",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                  splashColor: colorLight,
                  color: colorDark,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  },
                  onLongPress: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Continue",
                        style: TextStyle(fontSize: 18, color: colorLight),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: colorLight,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
