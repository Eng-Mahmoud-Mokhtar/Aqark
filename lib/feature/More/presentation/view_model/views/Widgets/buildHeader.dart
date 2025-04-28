import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';

Widget buildHeader({
  required BuildContext context,
  required String label,
  required String edit,
  required String iconPath,
  required VoidCallback onPressed,
  required String? imagePath,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onPressed,
    child: Padding(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: SubText,
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundColor: Colors.white,
              child: imagePath != null
                  ? ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: screenWidth * 0.14,
                  height: screenWidth * 0.14,
                ),
              )
                  : Icon(
                Icons.person_outline_sharp,
                size: screenWidth * 0.06,
                color: SubText,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  edit,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: SubText,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: screenWidth * 0.03,
            color: SubText,
          ),
        ],
      ),
    ),
  );
}
