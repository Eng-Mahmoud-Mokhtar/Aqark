import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../GetStart/presentation/view_model/views/GetStart.dart';

class NavigationButton extends StatelessWidget {
  final PageController controller;
  final bool onLastPage;

  const NavigationButton({
    Key? key,
    required this.controller,
    required this.onLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!onLastPage)
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: KprimaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SizedBox(
                  height: screenWidth * 0.12,
                  child: Center(
                    child: Text(
                      S.of(context).Skip,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: KprimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (!onLastPage) SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (onLastPage) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const Welcome();
                    }),
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KprimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: SizedBox(
                height: screenWidth * 0.12,
                child: Center(
                  child: Text(
                    onLastPage ? S.of(context).GetStarted : S.of(context).Next,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
