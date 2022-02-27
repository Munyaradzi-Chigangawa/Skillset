import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();

    _statusForm().then(
      (status) {
        if (status) {
           _navigateToHome();
        }
      }
    );
  }

  Future <bool> _statusForm() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }
      void _navigateToHome() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget> [
              Opacity(opacity: 1,
              child: Image.asset('Assets/Images/Skillset.png'),
              )
            ]
          ),
        )
      ),
    );
  }
}
