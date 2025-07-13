import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'AllRealEstates.dart';

class PropertyType extends StatelessWidget {
  const PropertyType({super.key});

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
        padding: EdgeInsets.all(screenWidth *0.04),
        child: Column(
          children: [
            _buildTypeOption(context, S.of(context).Buy, iconSize, fontSize),
             SizedBox(height: screenWidth *0.04),
            _buildTypeOption(context,  S.of(context).Rent, iconSize, fontSize),
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
              color: KprimaryColor.withOpacity(0.2),
              size:  screenWidth * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
