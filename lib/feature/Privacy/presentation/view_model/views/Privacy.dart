import 'package:bk/feature/Privacy/presentation/view_model/views/widgets/ListPrivacy.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final List<String> privacySections = getPrivacySections(context);

    return Scaffold(
      backgroundColor: backgroundColor,
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
          S.of(context).privacyPolicy,
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        itemCount: privacySections.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Text(
              privacySections[index],
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.03,
                height: 1.5,
              ),
            ),
          );
        },
      ),
    );
  }
}
