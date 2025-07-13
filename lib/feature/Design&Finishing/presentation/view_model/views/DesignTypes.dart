import 'package:bk/feature/Design&Finishing/presentation/view_model/views/InteriorDesignTypes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/Widgets/buildCategoryItem.dart';

class DesignTypesPage extends StatelessWidget {
  const DesignTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double containerWidth = (screenWidth - 48) / 2;
    final double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Design,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  onTap: () =>
                      _navigateToInteriorDesignTypes(context, S.of(context).FullDesign),
                ),
                const SizedBox(width: 16),
                buildCategoryItem(
                  context: context,
                  label: S
                      .of(context)
                      .InteriorDesign,
                  width: containerWidth,
                  iconSize: iconSize,
                  fontSize: fontSize,
                  onTap: () =>
                      _navigateToInteriorDesignTypes(context, S
                          .of(context)
                          .InteriorDesign),
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