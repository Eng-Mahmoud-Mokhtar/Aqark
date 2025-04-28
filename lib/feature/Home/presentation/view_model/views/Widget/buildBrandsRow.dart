import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../Developer/presentation/view_model/views/DevelopersPage.dart';

Widget buildBrandsRow(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  List<Map<String, String>> developers = [
    {'image': 'Assets/image 7.png', 'name': 'ORA'},
    {'image': 'Assets/image 13.png', 'name': 'L CAZAR'},
    {'image': 'Assets/image 15.png', 'name': 'PALM HILLS'},
    {'image': 'Assets/image 16.png', 'name': 'Mimary'},
    {'image': 'Assets/image 7.png', 'name': 'ORA'},
    {'image': 'Assets/image 13.png', 'name': 'L CAZAR'},
    {'image': 'Assets/image 15.png', 'name': 'PALM HILLS'},
    {'image': 'Assets/image 16.png', 'name': 'Mimary'},
  ];

  return SizedBox(
    height: screenWidth * 0.22,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: developers.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeveloperDetailsPage(
                          imagePath: developers[index]['image']!,
                          developerName: developers[index]['name']!,
                          PricesStart: "19,500,000 EGP",
                          ResaleStart: "8,456,250 EGP",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: KprimaryColor.withOpacity(0.1), width: 1.5),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        developers[index]['image']!,
                        width: screenWidth * 0.18,
                        height: screenWidth * 0.18,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (index != developers.length - 1)
              SizedBox(width: screenWidth * 0.03),
          ],
        );
      },
    ),
  );
}