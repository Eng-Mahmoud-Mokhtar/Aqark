import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: S.of(context).favorites,
          onBack: () => Navigator.pop(context),
          showSearch: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('Assets/file.png',
                      width: screenWidth * 0.3,
                      color: KprimaryColor.withOpacity(0.08),),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    S.of(context).nofavorites,
                    style: TextStyle(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    S.of(context).subNofavorites,
                    style: TextStyle(
                      color: SubText,
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          ),
        )
    );
  }
}
