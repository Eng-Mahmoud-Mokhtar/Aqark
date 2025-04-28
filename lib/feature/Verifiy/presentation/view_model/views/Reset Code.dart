import 'package:bk/feature/Verifiy/presentation/view_model/views/widgets/code.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/Button.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';

class ResetCode extends StatelessWidget {
  const ResetCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.17),
                  Center(
                    child: Image.asset(
                      'Assets/undraw_mail-sent_ujev.png',
                      width: screenWidth * 0.4,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    S.of(context).VerifyPhoneNumber,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    S.of(context).SubVerifyPhoneNumber,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const Code(),
                  SizedBox(height: screenHeight * 0.04),
                  Button(text:S.of(context).Verify, onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: KprimaryColor.withOpacity(0.4),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.03,
                        decoration: TextDecoration.underline,
                        decorationColor: KprimaryColor.withOpacity(0.4),
                      ),
                    ),
                    child:  Text( S.of(context).ResendCode),
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
      ),
    );
  }
}
