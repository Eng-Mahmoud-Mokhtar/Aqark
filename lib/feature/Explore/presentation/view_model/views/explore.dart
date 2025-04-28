import 'package:flutter/material.dart';

import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';




class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
        title: 'Explore',
    onBack: () =>Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Home()),
          (route) => false,
    ),
    onSearch: () {},
    showSearch: true,
        )
    );
  }
}

