import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveOnBoardingPage(
      imagePath: 'Assets/pexels-oleksandr-p-7599735 1.png',
      title: S.of(context).OnBoarding3title,
      description: S.of(context).OnBoarding3description,
    );
  }
}
