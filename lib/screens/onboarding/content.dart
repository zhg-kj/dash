import 'package:flutter/material.dart';

import 'package:dash/size_config.dart';
import 'package:dash/constants.dart';

class Content extends StatelessWidget {
  const Content({
    Key key,
    this.header,
    this.text,
    this.image,
  }) : super(key: key);
  final String header, text, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 6,
            child: Image.asset(
              image,
              height: getProportionateScreenHeight(265),
              width: getProportionateScreenWidth(235),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(23),
                    color: primaryColor,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: secondaryColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
