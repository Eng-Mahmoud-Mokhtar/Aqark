import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveOnBoardingPage(
      imagePath: 'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
      title: S.of(context).OnBoarding3title,
      description: S.of(context).OnBoarding3description,
    );
  }
}
