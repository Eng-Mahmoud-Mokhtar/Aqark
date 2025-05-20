import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  KeepAliveOnBoardingPage(
      imagePath: 'Assets/medium-shot-low-angle-view-architect-looking-away.jpg',
        title: S.of(context).OnBoarding2title,
    description: S.of(context).OnBoarding2description,
    );
  }
}
