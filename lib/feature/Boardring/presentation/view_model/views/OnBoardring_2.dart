import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  KeepAliveOnBoardingPage(
      imagePath: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        title: S.of(context).OnBoarding2title,
    description: S.of(context).OnBoarding2description,
    );
  }
}
