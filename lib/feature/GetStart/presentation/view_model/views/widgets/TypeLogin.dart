import 'package:flutter/material.dart';

class ButtonTypeLogin extends StatelessWidget {
  final String? text;
  final Color textColor;
  final String? imagePath;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  const ButtonTypeLogin({
    super.key,
    this.text,
    required this.textColor,
    this.imagePath,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenWidth * 0.12,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: screenWidth * 0.07,
                height: screenWidth * 0.07,
              ),
            if (imagePath != null) SizedBox(width: screenWidth * 0.04),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
