import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class One_Time_Intro_Page extends StatefulWidget {
  const One_Time_Intro_Page({super.key});

  @override
  State<One_Time_Intro_Page> createState() => _One_Time_Intro_PageState();
}

class _One_Time_Intro_PageState extends State<One_Time_Intro_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: IntroductionScreen(
        globalBackgroundColor: Colors.red,
        pages: [
          PageViewModel(
            titleWidget: const Text(
              "RNW NEWS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bodyWidget: Container(
              height: h * .75,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                      "lib/Components/Utils/Assets/home-page-img-first.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "RNW NEWS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bodyWidget: Container(
              height: h * .75,
              width: w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      "lib/Components/Utils/Assets/news-thumbnail.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "RNW NEWS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bodyWidget: Container(
              height: h * .75,
              width: w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("lib/Components/Utils/Assets/images.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: const Text(
              "RNW NEWS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bodyWidget: Container(
              height: h * .75,
              width: w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      "lib/Components/Utils/Assets/KTVZ-iPhone-with-news-app.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
        showNextButton: true,
        next: const Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        done: const Text(
          "Start",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        onDone: () async {
          Navigator.pushReplacementNamed(context, 'splesh');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("visited", true);
        },
      ),
    );
  }
}
