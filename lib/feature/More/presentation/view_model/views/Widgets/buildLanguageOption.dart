import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/LocaleCubit.dart';
import '../../../../../../core/utiles/constans.dart';

Widget buildLanguageOption(BuildContext context, String languageName, Locale locale) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isSelected = context.read<LocaleCubit>().state.languageCode == locale.languageCode;

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
