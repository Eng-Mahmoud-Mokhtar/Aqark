import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Brokers/presentation/view_model/views/Brokers.dart';
import '../../../../Developer/presentation/view_model/views/DevelopersPage.dart';
import 'PropertyType.dart';
import '../../../../../core/Widgets/buildCategoryItem.dart';

class RealEstateCategories extends StatelessWidget {
  const RealEstateCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.04;
    double spacing = screenWidth * 0.04;
    double containerWidth = (screenWidth - (padding * 2 + spacing)) / 2;
    double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.03;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).RealEstate,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Row(
              children: [
                buildCategoryItem(
                  context: context,
                  label: S.of(context).Properties,
                  onTap: () => _navigateTo(context, const PropertyType()),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                 SizedBox(width: screenWidth * 0.04),
                buildCategoryItem(
                  context: context,
                  label: S.of(context).Brokers,
                  onTap: () => _navigateTo(context, BrokersScreen()),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04),
            Row(
              children: [
                buildCategoryItem(
                  context: context,
                  label: S.of(context).Developers,
                  onTap: () => _navigateTo(context, DevelopersPage()),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                const SizedBox(width: 16),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
