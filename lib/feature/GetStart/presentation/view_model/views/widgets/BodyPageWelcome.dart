import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../login/presentation/view_model/views/login.dart';
import 'RowCreateAccount.dart';
import 'TypeLogin.dart';

class Bodypagewelcome extends StatelessWidget {
  const Bodypagewelcome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ButtonTypeLogin(
              text: S.of(context).SignInWithPhoneNumber,
              imagePath: 'Assets/icons8-phone-96.png',
              backgroundColor: Color(0xffecebeb),
              borderColor: const Color(0xffE9E9E9),
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            ButtonTypeLogin(
              text: S.of(context).SignInWithGoogle,
              imagePath: 'Assets/Google-icon.png',
              backgroundColor: backgroundColor,
              borderColor: const Color(0xffE9E9E9),
              textColor: Colors.black,
              onTap: () {
                print("Google Sign-In Clicked");
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            ButtonTypeLogin(
              text: S.of(context).SignInWithFacebook,
              imagePath: 'Assets/facebook_5968764.png',
              backgroundColor: Color(0xff1876F0),
              borderColor: const Color(0xffE9E9E9),
              textColor: backgroundColor,
              onTap: () {
                print("Sign in with Facebook Clicked");
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            const RowCreateAccount(),
          ],
        ),
      ],
    );
  }
}
