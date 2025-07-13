import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';

Widget buildLoading() {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(KprimaryColor),
      ),
    ),
  );
}