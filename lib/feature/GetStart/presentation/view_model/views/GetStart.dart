import 'package:bk/feature/GetStart/presentation/view_model/views/widgets/BodyPageWelcome.dart';
import 'package:bk/feature/GetStart/presentation/view_model/views/widgets/ContitionAndPrivacy.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.1),
                            Center(
                              child: Image.asset(
                                'Assets/1.png',
                                width: screenWidth * 0.355,
                                height: screenHeight * 0.25,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.1),
                            Bodypagewelcome(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                child: buildAgreementText(context),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.08,
            left: screenWidth * 0.04,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: screenHeight * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
