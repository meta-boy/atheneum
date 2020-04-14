import 'dart:ui';

import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/splash/license.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.asset(
            "assets/images/ob1.png",
            fit: BoxFit.cover,
          )),
          Positioned(
              bottom: -1,
              left: -1,
              right: -1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: colorBlack,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Atheneum, a free, open-source and ad-free app for reading manga / manhwa!",
                        style: TextStyle(color: colorLight, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "By Pressing the button below you will be directed towards the disclaimer and then continue to agree with the terms and conditions present in the license.",
                        style: TextStyle(color: colorLight, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                          splashColor: colorDark,
                          color: colorLight,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LicenseApp()));
                          },
                          onLongPress: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Disclaimer",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
