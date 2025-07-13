import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'DesignOptions.dart';

class InteriorDesignTypes extends StatelessWidget {
  final String title;

  const InteriorDesignTypes({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.42;
    final double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.035;
    final double padding = screenWidth * 0.04;

    final List<Map<String, dynamic>> designTypes = [
      {
        'title': S.of(context).ResidentialInteriors,
        'image': AssetsData.Logo,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DesignOptionsPage(
                designType: S.of(context).ResidentialInteriors,
              ),
            ),
          );
        }
      },
      {
        'title':S.of(context).CommercialInteriors,
        'image': AssetsData.Logo,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DesignOptionsPage(
                designType: S.of(context).CommercialInteriors,
              ),
            ),
          );
        }
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: title,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: designTypes.map((design) {
            return Padding(
              padding:  EdgeInsets.only(bottom:padding),
              child: GestureDetector(
                onTap: design['onTap'],
                child: Container(
                  padding: EdgeInsets.all(padding),
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
                            design['image'],
                            width: iconSize * 0.8,
                            height: iconSize * 0.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          design['title'],
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
                        size: screenWidth * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
