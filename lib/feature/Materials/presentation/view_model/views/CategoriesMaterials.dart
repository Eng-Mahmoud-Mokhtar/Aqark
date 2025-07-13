import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/Widgets/buildCategoryItem.dart';
import 'Materials.dart';

class CategoriesMaterials extends StatelessWidget {
  const CategoriesMaterials({Key? key}) : super(key: key);

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
        title: S.of(context).Materials,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Row(
              children: [
                buildCategoryItem(
                  context: context,
                  label: getLocalizedString(context, "ConstructionMaterials"),
                  onTap: () => _navigateTo(context, "ConstructionMaterials"),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                SizedBox(width: spacing),
                buildCategoryItem(
                  context: context,
                  label: getLocalizedString(context, "FinishingMaterials"),
                  onTap: () => _navigateTo(context, "FinishingMaterials"),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
            SizedBox(height: spacing),
            Row(
              children: [
                buildCategoryItem(
                  context: context,
                  label: getLocalizedString(context, "FurnitureMaterials"),
                  onTap: () => _navigateTo(context, "FurnitureMaterials"),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
                SizedBox(width: spacing),
                buildCategoryItem(
                  context: context,
                  label: getLocalizedString(context, "EquipmentMaterials"),
                  onTap: () => _navigateTo(context, "EquipmentMaterials"),
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Materials(sectionType: type),
      ),
    );
  }

  String getLocalizedString(BuildContext context, String key) {
    final s = S.of(context);
    switch (key) {
      case "ConstructionMaterials":
        return s.ConstructionMaterials;
      case "FinishingMaterials":
        return s.FinishingMaterials;
      case "FurnitureMaterials":
        return s.FurnitureMaterials;
      case "EquipmentMaterials":
        return s.EquipmentMaterials;
      default:
        return key;
    }
  }
}
