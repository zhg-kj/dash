import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dash/screens/onboarding/onboarding.dart';
import 'package:dash/screens/home/home.dart';
import 'package:dash/screens/assistant/assistant.dart';
import 'package:dash/themes.dart';

int firstStartUp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  firstStartUp = await prefs.getInt('firstStartUp');
  await prefs.setInt('firstStartUp', 1);
  print('firstStartUp ${firstStartUp}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
        '/assistant': (context) => AssistantScreen(),
      },
    );
  }
}
