import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';

Widget buildPriceRow(double screenWidth, String price, String ownerNumber,
    BuildContext context) {
  return Row(
    children: [
      Text(
        '${price} ${S.of(context).EGP}',
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          color: SecondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          // Handle phone call logic here
        },
        child: Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
            color: KprimaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.phone_outlined,
              size: screenWidth * 0.05,
              color: KprimaryColor,
            ),
          ),
        ),
      ),
      SizedBox(width: 10.w),
      GestureDetector(
        onTap: () {
          // Handle WhatsApp logic here
        },
        child: Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
            color: Color(0xff06cd46e),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: AspectRatio(
              aspectRatio: 2,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('Assets/logos_whatsapp-icon.png'),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}