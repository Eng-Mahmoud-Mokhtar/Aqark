import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: screenWidth * 0.1,
        leading: Padding(
          padding: EdgeInsets.only(left:screenHeight * 0.02),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: screenHeight * 0.03,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          S.of(context).About_Us,
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: const Color(0xffE9E9E9),
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                S.of(context).AboutCompany,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).SubAboutCompany,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                S.of(context).OurMission,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                S.of(context).SubOurMission,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}