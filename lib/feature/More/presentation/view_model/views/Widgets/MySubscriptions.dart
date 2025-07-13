import 'package:flutter/material.dart';
import '../../../../../../core/utiles/AppBar.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';

class MySubscriptions extends StatelessWidget {
  const MySubscriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final int remainingDays = 6;
    final bool isSubscribed = remainingDays > 0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).MySubscription,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: isSubscribed
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image.asset(
                    AssetsData.Logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                S.of(context).YourCurrentPackage,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildSubscribedPlanCard(
                context,
                title: S.of(context).MonthlySubscription,
                price: "\$19.99 / ${S.of(context).month}",
                description:
                "Ideal for short-term needs. Get instant access to premium listings, verified brokers, and top property opportunities — with the flexibility to cancel anytime.",
                remainingDays: remainingDays,
              ),
            ],
          )
              : ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight * 0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.2),
                    Image.asset('Assets/note_6052818.png',
                        height: screenWidth * 0.5,
                        width: screenWidth * 0.5,
                        color: KprimaryColor.withOpacity(0.2)),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      S.of(context).YouAreNotSubscribed,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: SubText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KprimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, screenWidth * 0.12),
                    ),
                    child: Text(
                      S.of(context).SubscribeNow,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscribedPlanCard(
      BuildContext context, {
        required String title,
        required String price,
        required String description,
        required int remainingDays,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: screenWidth * 0.01),
          padding: EdgeInsets.all(screenWidth * 0.04),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE0E0E0), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenWidth * 0.02),
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                price,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: SecondaryColor,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: SubText,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
    S.of(context).Remaining,
                    style: TextStyle(
                      fontSize: screenWidth * 0.028,
                      color: SubText,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    "$remainingDays",
                    style: TextStyle(
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    S.of(context).days,
                    style: TextStyle(
                      fontSize: screenWidth * 0.028,
                      color: SubText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.025,
              vertical: screenWidth * 0.012,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF1BCA02),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Text(
              S.of(context).Active,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
