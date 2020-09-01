import 'package:flutter/material.dart';

import 'package:dash/screens/onboarding/body.dart';
import 'package:dash/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
