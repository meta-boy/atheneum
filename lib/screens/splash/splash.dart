import 'package:atheneum/constants/color.dart';
import 'package:atheneum/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 0;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Onboarding()));
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
      _opacity = 1;
        
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/Atheneum.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Text("atheneum", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),))
          ],
        )),
      ),
    );
  }
}
