import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../KeepAlive.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveOnBoardingPage(
      imagePath: 'Assets/6f2b343f-53cd-4d5f-9b4b-fb72bddc2f8a.jpeg',
      title: S.of(context).OnBoarding1title,
      description: S.of(context).OnBoarding1description,
    );
  }
}
