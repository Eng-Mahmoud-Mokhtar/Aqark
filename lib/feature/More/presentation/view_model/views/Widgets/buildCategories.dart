import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';

Widget buildCategories({
  required BuildContext context,
  required String label,
  required String iconPath,
  required VoidCallback onPressed,
  Widget? trailing,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onPressed,
    child: Container(
      height: screenWidth * 0.12,
      padding: const EdgeInsets.symmetric( horizontal: 16),
      decoration: BoxDecoration(
        color: KprimaryColor.withOpacity(0.02),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            color: KprimaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          if (trailing != null) trailing,
          const SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: screenWidth * 0.03,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}