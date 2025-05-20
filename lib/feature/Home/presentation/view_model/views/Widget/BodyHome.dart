import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Design&Finishing/presentation/view_model/views/Design&Finishing.dart';
import '../../../../../GovernmentOperations/presentation/view_model/views/GovernmentOperations.dart';
import '../../../../../Materials/presentation/view_model/views/Materials.dart';
import '../../../../../Real estates/presentation/view_model/views/RealEstateCategories.dart';
import 'buildImages.dart';
import 'buildUserProfile.dart';

abstract class BodyHomeState {}
class BodyHomeInitial extends BodyHomeState {}
class BodyHomeLoading extends BodyHomeState {}

class BodyHomeLoaded extends BodyHomeState {
  final List<String> homeImages;
  BodyHomeLoaded({required this.homeImages});
}

class BodyHomeCubit extends Cubit<BodyHomeState> {
  BodyHomeCubit() : super(BodyHomeInitial());
  void loadData() async {
    emit(BodyHomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(BodyHomeLoaded(homeImages: homeImages));
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyHomeCubit()..loadData(),
      child: BlocBuilder<BodyHomeCubit, BodyHomeState>(
        builder: (context, state) {
          if (state is BodyHomeLoading) {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(KprimaryColor),
                ),
              ),
            );
          } else if (state is BodyHomeLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final screenHeight = constraints.maxHeight;
                final padding = screenWidth * 0.04;
                final containerWidth = (screenWidth - padding * 2 - screenWidth * 0.035) / 2;

                return Scaffold(
                  backgroundColor: backgroundColor,
                  body: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.065),
                        buildUserProfile(context),
                        SizedBox(height: screenHeight * 0.02),
                        AnimatedImageSlider(images: state.homeImages),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: Text(
                            S.of(context).Services,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Wrap(
                          spacing: screenWidth * 0.035,
                          runSpacing: screenHeight * 0.025,
                          children: List.generate(4, (index) {
                            return GestureDetector(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RealEstateCategories()));
                                    break;
                                  case 1:
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Materials()));
                                    break;
                                  case 2:
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DesignFinishing()));
                                    break;
                                  case 3:
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => GovernmentOperations()));
                                    break;
                                }
                              },
                              child: SizedBox(
                                width: containerWidth,
                                child: FeatureContainer(
                                  label: index == 0
                                      ? S.of(context).RealEstate
                                      : index == 1
                                      ? S.of(context).Materials
                                      : index == 2
                                      ? S.of(context).Design_Finishing
                                      : S.of(context).Government_Services,
                                  screenWidth: screenWidth,
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
class FeatureContainer extends StatelessWidget {
  final String label;
  final double screenWidth;

  const FeatureContainer({
    required this.label,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double containerWidth = screenWidth * 0.42;
    final double iconSize = containerWidth * 0.35;
    final double fontSize = screenWidth * 0.03;
    final double innerPadding = screenWidth * 0.04;

    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(innerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: KprimaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                AssetsData.Logo,
                width: iconSize * 0.8,
                height: iconSize * 0.8,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: fontSize * 4,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
