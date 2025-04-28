import 'package:bk/feature/SignUp/presentation/viewModel/views/widgets/Name.dart';
import 'package:bk/feature/SignUp/presentation/viewModel/views/widgets/alreadyHaveAccount.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/Button.dart';
import '../../../../../core/utiles/constans.dart';
import 'package:bk/feature/login/presentation/view_model/views/widgets/phoneNumber.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Padding(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              const Name(),
                              SizedBox(height: screenHeight * 0.02),
                              const PhoneNumber(),
                              SizedBox(height: screenHeight * 0.02),
                              Button(
                                text: S.of(context).SignUp,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Home()),
                                  );
                                },
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              const AlreadyHaveAccount(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.01,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: screenHeight * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
