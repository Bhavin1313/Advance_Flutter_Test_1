import 'package:advance_flutter_test_1/Views/details.dart';
import 'package:advance_flutter_test_1/Views/onetimeintro.dart';
import 'package:advance_flutter_test_1/Views/splesh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isVisitOnce = preferences.getBool("visited") ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: (isVisitOnce == true) ? 'splesh' : '/',
      routes: {
        '/': (context) => One_Time_Intro_Page(),
        'splesh': (context) => Splash(),
        'home': (context) => HomePage(),
        'details': (context) => DetailPage(),
      },
    ),
  );
}
