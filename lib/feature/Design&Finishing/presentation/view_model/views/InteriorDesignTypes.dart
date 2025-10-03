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
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: List.generate(designTypes.length, (index) {
            final design = designTypes[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: design['onTap'],
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.02,
                        horizontal: screenWidth * 0.04),
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
                          width: screenWidth* 0.12,
                          height: screenWidth* 0.12,
                          decoration: BoxDecoration(
                            color: KprimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              AssetsData.Logo,
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                              design['title'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: SubText,
                          size:  screenWidth * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
                if (index != designTypes.length - 1)
                  SizedBox(height: screenWidth * 0.04),
              ],
            );
          }),
        ),
      ),
    );
  }
}
