import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dash/size_config.dart';
import 'package:dash/screens/assistant/brain/brain.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(18.75),
                right: getProportionateScreenWidth(14.375),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: getProportionateScreenHeight(70),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(flex: 3, child: Column()),
            Spacer(),
            Expanded(flex: 6, child: Brain()),
            Spacer(),
            Expanded(
              flex: 5,
              child: Column(),
            )
          ],
        ),
      ),
    );
  }
}
