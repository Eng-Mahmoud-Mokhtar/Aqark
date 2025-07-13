import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'HomeDeveloper.dart';
import 'Widget/ProjectObjects.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.04;
    double spacing = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Developers,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: 0.75, // تناسب بين العرض والارتفاع لضبط الشكل
          children: [
            buildDeveloperCard(
              context: context,
              imagePath: "Assets/image 13.png",
              label: "L CAZAR",
            ),
            buildDeveloperCard(
              context: context,
              imagePath: "Assets/image 7.png",
              label: "ORA",
            ),
            buildDeveloperCard(
              context: context,
              imagePath: "Assets/image 15.png",
              label: "PALM HILLS",
            ),
            buildDeveloperCard(
              context: context,
              imagePath: "Assets/image 16.png",
              label: "Mimary",
            ),
            buildDeveloperCard(
              context: context,
              imagePath: "Assets/Screenshot (11).png",
              label: "MARAKEZ",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeveloperCard({
    required BuildContext context,
    required String imagePath,
    required String label,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - (screenWidth * 0.08 + screenWidth * 0.04)) / 2;
    double containerHeight = containerWidth / 0.75; // حسب الـ childAspectRatio
    double imageSize = screenWidth * 0.18;
    double fontSize = screenWidth * 0.035;

    return GestureDetector(
      onTap: () => _navigateToDeveloperDetails(context, imagePath, label),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KprimaryColor.withOpacity(0.1), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: KprimaryColor.withOpacity(0.1), width: 1.5),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: imageSize * 0.9,
                  height: imageSize * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
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

  void _navigateToDeveloperDetails(BuildContext context, String imagePath, String label) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeveloperDetailsPage(
          imagePath: imagePath,
          developerName: label,
          PricesStart: "19,500,000 EGP",
          ResaleStart: "8,456,250 EGP",
        ),
      ),
    );
  }
}
final List<Project> projects = [
  Project(
    name: "ZED East",
    PricesStart: '13,000,000 EGP',
    ResaleStart: '8,000,000 EGP',
    location: "New Cairo",
    image: "Assets/beautiful-aerial-view-futuristic-city-landscape-with-roads-cars-skyscrapers-dubai-uae.jpg",
    developerLogo: "Assets/ora_logo.png",
    developerName: "ORA Developers",
    details: "8,000,000",
    images: [
      "Assets/beautiful-aerial-view-futuristic-city-landscape-with-roads-cars-skyscrapers-dubai-uae.jpg",
      "Assets/cityscape-wuxi.jpg",
      "Assets/city-sunset.jpg",
      "Assets/chinese-city.jpg",
    ],
  ),
  Project(
    name: "ZED West",
    PricesStart: '14,500,000 EGP',
    ResaleStart: '9,200,000 EGP',
    location: "Sheikh Zayed",
    image: "Assets/movie-night-by-pool-whole-family.jpg",
    developerLogo: "Assets/ora_logo.png",
    developerName: "ORA Developers",
    details: "9,200,000 ",
    images: [
      "Assets/cityscape-wuxi.jpg",
      "Assets/city-sunset.jpg",
      "Assets/beautiful-aerial-view-futuristic-city-landscape-with-roads-cars-skyscrapers-dubai-uae.jpg",
      "Assets/chinese-city.jpg",
    ],
  ),
  Project(
    name: "Pyramids Hills",
    PricesStart: '11,200,000 EGP',
    ResaleStart: '7,000,000 EGP',
    location: "Giza",
    image: "Assets/chinese-city.jpg",
    developerLogo: "Assets/ora_logo.png",
    developerName: "ORA Developers",
    details: "7,000,000",
    images: [
      "Assets/beautiful-aerial-view-futuristic-city-landscape-with-roads-cars-skyscrapers-dubai-uae.jpg",
       "Assets/cityscape-wuxi.jpg",
      "Assets/city-sunset.jpg",
      "Assets/chinese-city.jpg",
    ],
  ),
  Project(
    name: "Solana",
    PricesStart: '18,000,000 EGP',
    ResaleStart: '12,000,000 EGP',
    location: "New Zayed",
    image: "Assets/cityscape-wuxi.jpg",
    developerLogo: "Assets/city-sunset.jpg",
    developerName: "ORA Developers",
    details: "12,000,000",
    images: [
      "Assets/cityscape-wuxi.jpg",
      "Assets/city-sunset.jpg",
      "Assets/beautiful-aerial-view-futuristic-city-landscape-with-roads-cars-skyscrapers-dubai-uae.jpg",
          "Assets/chinese-city.jpg",
    ],
  ),
];

class DeveloperDetailsPage extends StatefulWidget {
  final String imagePath;
  final String developerName;
  final String PricesStart;
  final String ResaleStart;

  const DeveloperDetailsPage({
    super.key,
    required this.imagePath,
    required this.developerName,
    required this.PricesStart,
    required this.ResaleStart,
  });

  @override
  _DeveloperDetailsPageState createState() => _DeveloperDetailsPageState();
}
class _DeveloperDetailsPageState extends State<DeveloperDetailsPage> {
  double screenWidth = 0;
  late List<String> areas;
  late String selectedArea;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    areas = [S.of(context).all, 'New Cairo', 'Sheikh Zayed', 'Giza', 'New Zayed'];
    selectedArea = S.of(context).all;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: widget.developerName,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.05),
            _buildMainContainer(),
            SizedBox(height: screenWidth * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).AvailableCompounds,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            _buildAreaFilter(screenWidth, screenHeight),
            SizedBox(height: screenWidth * 0.03),
            _buildProjectList(),
            SizedBox(height: screenWidth * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: screenWidth * 0.4,
      height: screenWidth * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: KprimaryColor.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.18,
            height: screenWidth * 0.18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: KprimaryColor.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                widget.imagePath,
                width: screenWidth * 0.16,
                height: screenWidth * 0.16,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Text(
              widget.developerName,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAreaFilter(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.03,
      ),
      child: SizedBox(
        height: screenWidth * 0.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: areas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedArea = areas[index];
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: Localizations.localeOf(context).languageCode == 'ar' ? screenWidth * 0.02 : 0,
                  right: Localizations.localeOf(context).languageCode == 'ar' ? 0 : screenWidth * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: selectedArea == areas[index]
                      ? KprimaryColor
                      : KprimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    areas[index],
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: selectedArea == areas[index]
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProjectList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: projects
            .where((project) => selectedArea == S.of(context).all || project.location == selectedArea)
            .map((project) => _buildProjectCard(project))
            .toList(),
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDeveloper(
              project: project,
              developerLogo: widget.imagePath,
              developerName: widget.developerName,
              PricesStart: project.PricesStart,
              ResaleStart: project.ResaleStart,
              apartments: [],
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        color: Colors.transparent,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                project.image,
                width: screenWidth * 0.3,
                height: screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth * 0.009),
                  Text(
                    project.location,
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth * 0.009),
                  Text(
                    "${S.of(context).Startingfrom} ${project.details} ${S.of(context).EGP}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                      color: KprimaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.04,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


