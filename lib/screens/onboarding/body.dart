import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dash/size_config.dart';
import 'package:dash/constants.dart';
import 'package:dash/screens/onboarding/content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> pageData = [
    {
      "header": "YOUR SECOND PAIR OF EYES",
      "text": "With DASH you get your very own backseat driver.",
      "image": "assets/images/eyes.png",
      "button": "Skip",
    },
    {
      "header": "DRIVE UNINTERRUPTED",
      "text":
          "DASH witholds all incoming notifications and calls until the car is safely stopped.",
      "image": "assets/images/uninterrupted.png",
      "button": "Skip",
    },
    {
      "header": "A FITTING PARTNERSHIP",
      "text":
          "The best way to utilize this AI assistant is to work with it. Listen to its warnings, but use your best judgement above all.",
      "image": "assets/images/robot.png",
      "button": "Let's Drive",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: pageData.length,
                itemBuilder: (context, index) => Content(
                  header: pageData[index]['header'],
                  image: pageData[index]['image'],
                  text: pageData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pageData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    currentPage != 2
                        ? FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Text("Skip"),
                          )
                        : FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            color: secondaryLightColor,
                            child: Text("LET'S GO",
                                style: TextStyle(color: primaryLightColor))),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: secondaryLightColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
