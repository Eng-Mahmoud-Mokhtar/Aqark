import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'HomeDeveloper.dart';
import 'Widget/ProjectObjects.dart';

class DevelopersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title:S.of(context).Developers,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.80,
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
    return GestureDetector(
      onTap: () => _navigateToDeveloperDetails(context, imagePath, label),
      child: Container(
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KprimaryColor.withOpacity(0.1), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.18,
              height: screenWidth * 0.18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: KprimaryColor.withOpacity(0.1), width: 1.5),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: screenWidth * 0.16,
                  height: screenWidth * 0.16,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
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
    details: "Starting from 13M EGP",
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
    details: "Starting from 14.5M EGP",
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
    details: "Starting from 11.2M EGP",
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
    details: "Starting from 18M EGP",
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

  void didChangeDependencies() {
    super.didChangeDependencies();
    areas = [S.of(context).all, 'New Cairo', 'Sheikh Zayed', 'Giza', 'New Zayed'];
    selectedArea = S.of(context).all;
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
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
            _buildMainContainer(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
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
            _buildAreaFilter(),
            _buildProjectList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: screenWidth * 0.4,
      height: screenWidth * 0.5,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: KprimaryColor.withOpacity(0.1),
            width: 1.5
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
                  width: 1.5
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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

  Widget _buildAreaFilter() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
        margin: const EdgeInsets.only(bottom: 16),
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
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    project.details,
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


