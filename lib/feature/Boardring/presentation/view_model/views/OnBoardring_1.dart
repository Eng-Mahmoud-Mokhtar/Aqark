import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveOnBoardingPage(
      imagePath: 'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      title: S.of(context).OnBoarding1title,
      description: S.of(context).OnBoarding1description,
    );
  }
}
