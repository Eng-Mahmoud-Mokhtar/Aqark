import 'package:flutter/material.dart';
import '../utiles/Assets_Data.dart';
import '../utiles/constans.dart';

Widget buildCategoryItem({
  required BuildContext context,
  required String label,
  required VoidCallback onTap,
  required double width,
  required double iconSize,
  required double fontSize,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      padding: EdgeInsets.all(width * 0.08),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: KprimaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                AssetsData.Logo,
                width: iconSize * 0.8,
                height: iconSize * 0.8,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: fontSize * 2.8,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
