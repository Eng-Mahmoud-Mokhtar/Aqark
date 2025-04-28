import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/feature/Boardring/presentation/view_model/views/widgets/NavigationButton.dart';
import 'package:bk/feature/Boardring/presentation/view_model/views/OnBoardring_1.dart';
import 'package:bk/feature/Boardring/presentation/view_model/views/OnBoardring_2.dart';
import 'package:bk/feature/Boardring/presentation/view_model/views/widgets/buildDot.dart';
import '../../../../../../core/utiles/constans.dart';
import '../OnBoardring_3.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  void changePage(int index) => emit(index);
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(keepPage: true);
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            BlocBuilder<OnBoardingCubit, int>(
              builder: (context, currentPage) {
                return PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) =>
                      context.read<OnBoardingCubit>().changePage(index),
                  children: const [OnBoarding1(), OnBoarding2(), OnBoarding3()],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.0125),
                child: BlocBuilder<OnBoardingCubit, int>(
                  builder: (context, currentPage) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DotsIndicator(
                            currentPage: currentPage.toDouble(), totalDots: 3),
                        SizedBox(height: screenHeight * 0.25),
                        NavigationButton(
                          controller: controller,
                          onLastPage: currentPage == 2,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
