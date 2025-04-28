import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import 'Engineer.dart';

class DesignFinishing extends StatelessWidget {
  const DesignFinishing({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Interior Design',
        'icon': Icons.room_preferences,
        'details': {
          'description': 'Innovative interior designs to suit all tastes.',
          'services': [
            'Bedroom design',
            'Living room design',
            'Kitchen design',
          ],
          'image': 'Assets/blueprint.png',
        },
      },
      {
        'title': 'Building',
        'icon': Icons.build,
        'details': {
          'description': 'High-quality finishing and construction with modern techniques.',
          'services': [
            'Exterior finishing',
            'Interior finishing',
            'Bathroom finishing',
          ],
          'image': 'assets/finishing.jpg',
        },
      },
      {
        'title': 'Engineers',
        'icon': Icons.engineering,
        'details': {
          'description': 'Specialized engineers in design and finishing.',
          'services': [
            'Decoration engineer',
            'Finishing engineer',
            'Construction engineer',
          ],
          'image': 'assets/engineers.jpg',
        },
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Design & Finishing',
        onBack: () => Navigator.pop(context),
        onSearch: () {},
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCategoryItem(
              imagePath: "Assets/blueprint.png",
              label: 'Interior Design',
              onTap: () => _navigateToDetails(context, categories[0]),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/building.png",
              label: 'Building',
              onTap: () => _navigateToDetails(context, categories[1]),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/architect.png",
              label: 'Engineers',
              onTap: () => _navigateToDetails(context, categories[2]),
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: KprimaryColor, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              fit: BoxFit.contain,
              color: KprimaryColor,
            ),
            const SizedBox(height: 12),
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

  void _navigateToDetails(BuildContext context, Map<String, dynamic> category) {
    if (category['title'] == 'Engineers') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineersScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DesignDetails(
            title: category['title'],
            details: category['details'],
          ),
        ),
      );
    }
  }
}

class DesignDetails extends StatelessWidget {
  final String title;
  final Map<String, dynamic> details;

  const DesignDetails({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: title,
        onBack: () => Navigator.pop(context),
        onSearch: () {},
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              details['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details['description'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Available Services:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...details['services'].map((service) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          service,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




