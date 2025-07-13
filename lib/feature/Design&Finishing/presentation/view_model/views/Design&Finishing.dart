import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/Widgets/buildCategoryItem.dart';
import 'ContractingCompany.dart';
import 'InteriorDesignTypes.dart';

class DesignFinishing extends StatelessWidget {
  const DesignFinishing({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double padding = screenWidth * 0.04;
    double spacing = screenWidth * 0.04;
    double containerWidth = (screenWidth - (padding * 2 + spacing)) / 2;
    double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.03;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S
            .of(context)
            .Design_Finishing,
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
                  label: S.of(context).Design,
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  onTap: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DesignTypesPage(),
                        ),
                      ),
                ),
                SizedBox(width: screenWidth * 0.04),
                buildCategoryItem(
                  context: context,
                  label: S
                      .of(context)
                      .Contracting,
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  onTap: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContractingCompanies(),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class DesignTypesPage extends StatelessWidget {
  const DesignTypesPage({super.key});

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
        title: S.of(context).Design,
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
                  label: S.of(context).FullDesign,
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  onTap: () => _navigateToInteriorDesignTypes(context,S.of(context).FullDesign),
                ),
                SizedBox(width: screenWidth * 0.04),
                buildCategoryItem(
                  context: context,
                  label: S.of(context).InteriorDesign,
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  onTap: () => _navigateToInteriorDesignTypes(context, S.of(context).InteriorDesign),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToInteriorDesignTypes(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InteriorDesignTypes(title: title),
      ),
    );
  }
}



