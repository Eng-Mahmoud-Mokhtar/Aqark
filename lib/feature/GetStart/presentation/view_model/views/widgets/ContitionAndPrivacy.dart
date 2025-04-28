import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Privacy/presentation/view_model/views/Privacy.dart';
import '../../../../../TermsAndCondition/presentation/view_model/views/TermsOfCondition.dart';

Widget buildAgreementText(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal:screenWidth * 0.04),
    child: Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
        S.of(context).ByContinuingYouAgree,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: screenWidth * 0.03,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TermsOfCondition()),
            );
          },
          child: Text(
            S.of(context).termsAndConditions,
            style: TextStyle(
              color: KprimaryColor,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ),
        Text(
          S.of(context).and,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: screenWidth * 0.03,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Privacy()),
            );
          },
          child: Text(
            S.of(context).privacyPolicy,
            style: TextStyle(
              color: KprimaryColor,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ),
      ],
    ),
  );
}
