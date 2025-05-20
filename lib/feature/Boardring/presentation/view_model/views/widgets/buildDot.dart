import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utiles/constans.dart';

class DotsIndicator extends StatelessWidget {
  final double currentPage;
  final int totalDots;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
    required this.totalDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWeight = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          width: currentPage == index ? screenWeight*0.06 : screenWeight*0.02,
          height: currentPage == index ? screenWeight*0.02 : screenWeight*0.02,
          decoration: BoxDecoration(
            color: currentPage == index ? SecondaryColor: Colors.grey[300],
            borderRadius: BorderRadius.circular(18.w),
          ),
        ),
      ),
    );
  }
}
