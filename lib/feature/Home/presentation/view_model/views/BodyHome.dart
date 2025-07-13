import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Design&Finishing/presentation/view_model/views/Design&Finishing.dart';
import '../../../../GovernmentOperations/presentation/view_model/views/GovernmentCategories.dart';
import '../../../../Materials/presentation/view_model/views/CategoriesMaterials.dart';
import '../../../../Notification/presentation/view_model/views/Notification.dart';
import '../../../../Real estates/presentation/view_model/views/RealEstateCategories.dart';
import '../BodyHome_cubit.dart';
import '../BodyHome_state.dart';
import 'Widget/FeatureContainer.dart';
import 'Widget/buildError.dart';
import 'Widget/buildImages.dart';
import 'Widget/buildLoading.dart';
import 'Widget/buildUserProfile.dart';


class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyHomeCubit()..loadData(),
      child: BlocBuilder<BodyHomeCubit, BodyHomeState>(
        builder: (context, state) {
          if (state is BodyHomeLoading) {
            return buildLoading();
          } else if (state is BodyHomeLoaded) {
            return _buildLoaded(context, state.homeImages);
          } else if (state is BodyHomeError) {
            return buildError(context);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoaded(BuildContext context, List<String> images) {
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
                AnimatedImageSlider(images: images),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  S.of(context).Services,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: KprimaryColor,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesMaterials()));
                            break;
                          case 2:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DesignFinishing()));
                            break;
                          case 3:
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GovernmentCategories()));
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
  }
}
