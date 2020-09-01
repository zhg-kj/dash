import 'package:flutter/material.dart';

import 'package:dash/screens/home/body.dart';
import 'package:dash/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Text(
                'DASH',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: getProportionateScreenWidth(25)),
              ),
            ),
            ListTile(
              title: Text('UI',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: getProportionateScreenWidth(10))),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: getProportionateScreenWidth(10)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: getProportionateScreenWidth(10)),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Body(),
      ),
    );
  }
}
