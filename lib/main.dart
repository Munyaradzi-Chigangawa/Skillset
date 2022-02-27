import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillset/Notifier/notifier.dart';
import 'package:skillset/UI/splash.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileNotifier(),
        ),
      ],
      child: MyApp(),
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.black,
  //   statusBarColor: Colors.black,
  // )
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
    );
  }
}
