import 'package:flutter/material.dart';

Widget buildInfoRow(String label, String value, double screenWidth) {
  return Row(
    children: [
      SizedBox(
        width: screenWidth * 0.3,
        child: Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(width: screenWidth * 0.1),
      Expanded(
        child: Text(
          value,
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
