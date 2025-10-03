import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/LocaleCubit.dart';
import 'package:bk/feature/Favorites/presentation/view_model/views/Favorites.dart';
import 'package:bk/feature/Privacy/presentation/view_model/views/Privacy.dart';
import 'package:bk/feature/AboutUs/presentation/view_model/views/AboutUs.dart';
import 'package:bk/feature/TermsAndCondition/presentation/view_model/views/TermsOfCondition.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../ContectUs/presentation/view_model/views/ContectUs.dart';
import '../../../../EditProfile/presentation/view_model/views/EditProfile.dart';
import 'Widgets/MySubscriptions.dart';
import 'Widgets/buildCategoriesMore.dart';
import 'Widgets/buildHeader.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final translations = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              buildHeaderMore(
                context: context,
                label: "Mahmoud Mokhtar",
                edit: S.of(context).editProfile,
                iconPath: "Assets/edit_icon.png",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
                imagePath: null,
              ),
              const Divider(
                color: Color(0xffe7e6e6),
                thickness: 1.5,
              ),
              SizedBox(height: screenHeight * 0.03),
              buildCategoriesMore(
                context: context,
                label: translations.contactUs,
                iconPath: 'Assets/icons8-ringer-volume-50.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: S.of(context).MySubscription,
                iconPath: 'Assets/icons8-warranty-50.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MySubscriptions(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.favorite,
                iconPath: 'Assets/icons8-favorite-48.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.rateUs,
                iconPath: 'Assets/icons8-edit-property-32.png',
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ContactUsScreen(),
                  //   ),
                  // );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.aboutUs,
                iconPath: 'Assets/icons8-about-48.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.language,
                iconPath: 'Assets/icons8-globe-48.png',
                onPressed: () {
                  // Toggle language between Arabic and English
                  final newLocale = context.read<LocaleCubit>().state.languageCode == 'ar'
                      ? const Locale('en')
                      : const Locale('ar');
                  context.read<LocaleCubit>().changeLanguage(newLocale);
                },
                trailing: Text(
                  context.read<LocaleCubit>().state.languageCode == 'ar'
                      ? 'العربية'
                      : 'English',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailingIcon: Icon(
                  Icons.swap_horiz, // Double arrow icon
                  size: screenWidth * 0.04,
                  color: KprimaryColor.withOpacity(0.5),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.termsAndConditions,
                iconPath: 'Assets/icons8-terms-and-conditions-48.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TermsOfCondition(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategoriesMore(
                context: context,
                label: translations.privacyPolicy,
                iconPath: 'Assets/icons8-security-lock-48.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Privacy(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}

