import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import 'package:bk/core/utiles/LocaleCubit.dart';
import 'package:bk/feature/Favorites/presentation/view_model/views/Favorites.dart';
import 'package:bk/feature/Privacy/presentation/view_model/views/Privacy.dart';
import 'package:bk/feature/AboutUs/presentation/view_model/views/AboutUs.dart';
import 'package:bk/feature/TermsAndCondition/presentation/view_model/views/TermsOfCondition.dart';
import '../../../../../generated/l10n.dart';
import '../../../../ContectUs/presentation/view_model/views/ContectUs.dart';
import '../../../../EditProfile/presentation/view_model/views/EditProfile.dart';
import '../../../../Workers/presentation/view_model/views/Workers.dart';
import 'Widgets/buildCategories.dart';
import 'Widgets/buildHeader.dart';
import 'Widgets/buildLanguageOption.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        return Container(
          width: screenWidth,
          constraints: BoxConstraints(
            minHeight: screenHeight * 0.4,
            maxHeight: screenHeight * 0.8,
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Image.asset(
                'Assets/icons8-globe-48.png',
                width: 70.w,
                height: 70.h,
                color: KprimaryColor.withOpacity(0.1),
              ),
              Text(
                S.of(context).selectAppLanguage,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              buildLanguageOption(context, 'العربية', const Locale('ar')),
              buildLanguageOption(context, 'English', const Locale('en')),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
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
              buildHeader(
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
              buildCategories(
                context: context,
                label: S.of(context).Workers,
                iconPath: 'Assets/icons8-bag-96.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WorkersScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategories(
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
              buildCategories(
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
              buildCategories(
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
              buildCategories(
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
              buildCategories(
                context: context,
                label: translations.language,
                iconPath: 'Assets/icons8-globe-48.png',
                onPressed: () {
                  _showLanguageBottomSheet(context);
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
              ),
              SizedBox(height: screenHeight * 0.025),
              buildCategories(
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
              buildCategories(
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

