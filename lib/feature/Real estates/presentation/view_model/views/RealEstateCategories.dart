import 'package:bk/feature/Real%20estates/presentation/view_model/views/AllRealEstates.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Brokers/presentation/view_model/views/Brokers.dart';
import '../../../../Developer/presentation/view_model/views/DevelopersPage.dart';


class RealEstateCategories extends StatelessWidget {
  const RealEstateCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).RealEstate,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCategoryItem(
            imagePath: "Assets/investment.png",
              label: S.of(context).Properties,
              onTap: () => _navigateTo(context, AllApartments(apartments: [])),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/user.png",
              label: S.of(context).Brokers,
              onTap: () => _navigateTo(context, BrokersScreen()),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/business.png",
              label: S.of(context).Developers,
              onTap: () => _navigateTo(context, DevelopersPage()),
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KprimaryColor, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              fit: BoxFit.contain,
              color: KprimaryColor,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
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



