import 'package:flutter/material.dart';

import '../../../../../../core/utiles/constans.dart';

Widget buildLocationRow(double screenWidth, String address, String location) {
  return Row(
    children: [
      Icon(Icons.location_on_outlined,
          size: screenWidth * 0.04, color: SecondaryColor),
      SizedBox(width: screenWidth * 0.01),
      Expanded(
        child: Text(
          '$address , $location',
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
