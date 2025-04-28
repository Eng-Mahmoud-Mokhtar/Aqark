import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';

Widget buildDetailsRow(BuildContext context, double screenWidth, String baths,
    String beds, String size) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.01,
        vertical: screenWidth * 0.01,
      ),
      decoration: BoxDecoration(
        color: KprimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset(
            'Assets/icons8-bathtub-48.png',
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
          ),
          SizedBox(width: screenWidth * 0.01),
          Text(
            baths,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: KprimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: screenWidth * 0.02),
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.01,
        vertical: screenWidth * 0.01,
      ),
      decoration: BoxDecoration(
        color: KprimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.asset(
            'Assets/icons8-bedroom-50.png',
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
          ),
          SizedBox(width: screenWidth * 0.01),
          Text(
            beds,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: KprimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: screenWidth * 0.02),
    Text(
      '|',
      style: TextStyle(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.w300,
        color: Colors.grey.shade400,
      ),
    ),
    SizedBox(width: screenWidth * 0.02),
    Image.asset(
      'Assets/icons8-enlarge-30.png',
      width: screenWidth * 0.04,
      height: screenWidth * 0.04,
    ),
    SizedBox(width: screenWidth * 0.01),
    Text(
      '$size${S.of(context).m}',
      style: TextStyle(
        fontSize: screenWidth * 0.03,
        color: const Color(0xff9E9E9E),
        fontWeight: FontWeight.w400,
      ),
    ),
  ]);
}