import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:dash/size_config.dart';
import 'package:dash/constants.dart';

WeatherFactory wf = new WeatherFactory("394503c49af394a70a2b66caf103fa49");

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _weather = 'Getting forecast...';
  String _location = 'Getting location...';
  String _greeting = 'Great day for a drive.';
  int _temperature = 0;
  IconData _weatherIcon = WeatherIcons.cloud;

  _BodyState() {
    getWeather().then((weather) => setState(() {
          _weather = weather.weatherMain + ', ' + weather.weatherDescription;
          _location = weather.areaName;
          _temperature = weather.temperature.celsius.truncate();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: getProportionateScreenHeight(70),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(14.375)),
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
              ],
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(18.75)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Kai,',
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: getProportionateScreenWidth(25)),
                    ),
                    Text(
                      _greeting,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: getProportionateScreenWidth(20)),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(38),
                            width: getProportionateScreenWidth(38),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle),
                            margin: EdgeInsets.only(
                                right: getProportionateScreenWidth(9.375)),
                            child: Icon(
                              _weatherIcon,
                              color: primaryLightColor,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _weather,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                              ),
                              Text(
                                _location +
                                    ', ' +
                                    _temperature.toString() +
                                    '°C',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize:
                                            getProportionateScreenWidth(10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(9.375)),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(35)),
                                child: Image.asset('assets/images/car.png'),
                              )),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Review these safe driving practices before we hit the road.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          fontSize:
                                              getProportionateScreenWidth(15)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(9.375)),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Maintain 2 meteres of distance from the vehicle in front of you.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          fontSize:
                                              getProportionateScreenWidth(15)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(35)),
                                child: Image.asset('assets/images/car.png'),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(9.375)),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(35)),
                                child: Image.asset('assets/images/car.png'),
                              )),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pellentesque, dui non mattis lobortis, mi.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          fontSize:
                                              getProportionateScreenWidth(15)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(9.375)),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pellentesque, dui non mattis lobortis, mi.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          fontSize:
                                              getProportionateScreenWidth(15)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionateScreenWidth(35)),
                                child: Image.asset('assets/images/car.png'),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(9.375)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          child: FlatButton(
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/assistant');
                            },
                            child: Text(
                              "LET'S DRIVE",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                    Text('  Day display currently enabled.',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: getProportionateScreenWidth(10)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Weather> getWeather() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Weather w = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    return w;
  }
}
