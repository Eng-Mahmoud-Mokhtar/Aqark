import 'package:flutter/material.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../../../../../../core/utiles/constans.dart';

class FeatureContainer extends StatelessWidget {
  final String label;
  final double screenWidth;

  const FeatureContainer({
    required this.label,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double containerWidth = screenWidth * 0.42;
    final double iconSize = containerWidth * 0.3;
    final double fontSize = screenWidth * 0.03;
    final double innerPadding = screenWidth * 0.04;

    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(innerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetsData.Logo,
                  height: iconSize,
                  fit: BoxFit.contain,
                  color: KprimaryColor,
                ),
                SizedBox(
                  height: containerWidth/4,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: fontSize * 1.5,
            color: KprimaryColor.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
