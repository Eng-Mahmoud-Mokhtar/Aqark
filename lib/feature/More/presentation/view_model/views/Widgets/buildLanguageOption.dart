import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart'; // استيراد مكتبة modal_bottom_sheet
import '../../../../../../core/utiles/LocaleCubit.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';

Widget buildLanguageOption(
    BuildContext context,
    String languageName,
    Locale locale,
    Locale currentLocale,
    double screenWidth,
    ) {
  final isSelected = currentLocale.languageCode == locale.languageCode;

  return GestureDetector(
    onTap: () {
      context.read<LocaleCubit>().changeLanguage(locale);
      Navigator.pop(context);
    },
    child: Container(
      height: screenWidth * 0.12,
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: SubText.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: screenWidth * 0.04),
          Text(
            languageName,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          Spacer(),
          Container(
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KprimaryColor, width: 2),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: screenWidth * 0.025,
                height: screenWidth * 0.025,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KprimaryColor,
                ),
              ),
            )
                : null,
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
    ),
  );
}

void showLanguageBottomSheet(BuildContext context) {
  final currentLocale = context.read<LocaleCubit>().state;
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  showCupertinoModalBottomSheet(
    context: context,
    expand: false,
    backgroundColor: Colors.white,
    topRadius: const Radius.circular(12),
    builder: (context) => Container(
      width: screenWidth,
      constraints: BoxConstraints(
        minHeight: screenHeight * 0.4,
        maxHeight: screenHeight * 0.8,
      ),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Icon(
            Icons.language_outlined,
            size: 50.w,
            color: KprimaryColor.withOpacity(0.1),
          ),
          SizedBox(height: 10.h),
          Text(
            S.of(context).selectAppLanguage,
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 10.h),
          buildLanguageOption(context, 'العربية', const Locale('ar'), currentLocale, screenWidth),
          buildLanguageOption(context, 'English', const Locale('en'), currentLocale, screenWidth),
          SizedBox(height: 10.h),
        ],
      ),
    ),
  );
}
