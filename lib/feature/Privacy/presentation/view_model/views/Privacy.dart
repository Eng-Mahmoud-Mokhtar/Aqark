import 'package:bk/feature/Privacy/presentation/view_model/views/widgets/ListPrivacy.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
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
      appBar: CustomAppBar(
        title: S.of(context).privacyPolicy,
        onBack: () => Navigator.pop(context),
        showSearch: false,
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
