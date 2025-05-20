import 'package:flutter/material.dart';
import 'package:bk/feature/Real%20estates/presentation/view_model/views/AllRealEstates.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Brokers/presentation/view_model/views/Brokers.dart';
import '../../../../Developer/presentation/view_model/views/DevelopersPage.dart';

class RealEstateCategories extends StatelessWidget {
  const RealEstateCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 48) / 2;
    double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).RealEstate,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildCategoryItem(
                  context: context,
                  label: S.of(context).Properties,
                  onTap: () => _navigateTo(context, const PropertyTypeSelectionPage()),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                const SizedBox(width: 16),
                _buildCategoryItem(
                  context: context,
                  label: S.of(context).Brokers,
                  onTap: () => _navigateTo(context, BrokersScreen()),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCategoryItem(
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

  Widget _buildCategoryItem({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    required double width,
    required double iconSize,
    required double fontSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(width * 0.08),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
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
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: KprimaryColor,
              ),
              textAlign: TextAlign.center,
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

// ----------------------------------------------------------------
// ✅ صفحة اختيار نوع العقار (Buy, Rent, Sale) — بشكل عمودي أنيق
// ----------------------------------------------------------------

class PropertyTypeSelectionPage extends StatelessWidget {
  const PropertyTypeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.42;
    final double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Properties,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTypeOption(context, "Buy", iconSize, fontSize),
            const SizedBox(height: 16),
            _buildTypeOption(context, "Rent", iconSize, fontSize),
            const SizedBox(height: 16),
            _buildTypeOption(context, "Sell", iconSize, fontSize),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeOption(BuildContext context, String type, double iconSize, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double innerPadding = screenWidth * 0.04;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllApartments(apartments: []),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(innerPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
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
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                type,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size:  screenWidth * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
