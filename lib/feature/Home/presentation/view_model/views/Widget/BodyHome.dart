import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Design&Finishing/presentation/view_model/views/Design&Finishing.dart';
import '../../../../../GovernmentOperations/presentation/view_model/views/GovernmentOperations.dart';
import '../../../../../Materials/presentation/view_model/views/Materials.dart';
import '../../../../../Real estates/presentation/view_model/views/RealEstateCategories.dart';
import 'FeatureContainer.dart';
import 'buildBrandsRow.dart';
import 'buildImages.dart';
import 'buildSearchBar.dart';
import 'buildUserProfile.dart';

abstract class BodyHomeState {}

class BodyHomeInitial extends BodyHomeState {}

class BodyHomeLoading extends BodyHomeState {}

class BodyHomeLoaded extends BodyHomeState {
  final List<String> homeImages;
  final List<String> serviceImages;
  BodyHomeLoaded({required this.homeImages, required this.serviceImages});
}

class BodyHomeCubit extends Cubit<BodyHomeState> {
  BodyHomeCubit() : super(BodyHomeInitial());

  void loadData() async {
    emit(BodyHomeLoading());
    await Future.delayed(const Duration(seconds: 2));


    final List<String> serviceImages = [
      'Assets/property.png',
      'Assets/wheel-barrow.png',
      'Assets/stationery.png',
          'Assets/feature (1).png',
    ];

    emit(BodyHomeLoaded(homeImages: homeImages, serviceImages: serviceImages));
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            return Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      buildUserProfile(context),
                      const SizedBox(height: 12),
                      Divider(color: KprimaryColor.withOpacity(0.1), thickness: 1, height: 1),
                      const SizedBox(height: 12),
                      buildBrandsRow(context),
                      buildSearchBar(context),
                      const SizedBox(height: 12),
                      AnimatedImageSlider(images: state.homeImages),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).Services,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: KprimaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
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
                            child: FeatureContainer(
                              label: index == 0
                                  ? S.of(context).RealEstate
                                  : index == 1
                                  ? S.of(context).Materials
                                  : index == 2
                                  ? S.of(context).Design_Finishing
                                  : S.of(context).Government_Services,
                              imagePath: state.serviceImages[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

