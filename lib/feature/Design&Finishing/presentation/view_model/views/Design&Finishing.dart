import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'ContractingCompany.dart';
import 'Engineer.dart';
import 'InteriorDesign.dart';


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
          'description': 'Innovative interior designs tailored to all tastes and needs.',
          'services': [
            'Bedroom Design',
            'Living Room Design',
            'Kitchen Design',
            'Bathroom Design',
            'Home Office Design',
          ],
          'image': 'Assets/armchair-green-living-room-with-copy-space.jpg',
          'features': [
            '3D design visualization',
            'Color and material selection',
            'Space-saving solutions',
            'Integrated lighting design',
            'Modern or classic designs per request',
          ],
          'process': [
            {'step': '1', 'title': 'Consultation', 'desc': 'Discuss requirements and ideas'},
            {'step': '2', 'title': 'Survey', 'desc': 'Measure space and gather specifications'},
            {'step': '3', 'title': 'Initial Design', 'desc': 'Present preliminary concepts'},
            {'step': '4', 'title': 'Final Design', 'desc': 'Prepare detailed design'},
            {'step': '5', 'title': 'Execution', 'desc': 'Oversee implementation with the team'},
          ],
          'portfolio': [
            'Assets/armchair-green-living-room-with-copy-space.jpg',
            'Assets/modern-office-space-with-futuristic-decor-furniture.jpg',
            'Assets/armchair-green-living-room-with-copy-space.jpg',
          ],
        },
      },
      {
        'title': 'Building',
        'icon': Icons.build,
        'details': {
          'description': 'High-quality finishing and construction with modern techniques.',
          'services': [
            'Exterior Finishing',
            'Interior Finishing',
            'Bathroom Finishing',
          ],
          'image': 'Assets/building.png',
        },
      },
      {
        'title': 'Engineers',
        'icon': Icons.engineering,
        'details': {
          'description': 'Specialized engineers for design and finishing.',
          'services': [
            'Interior Design Engineer',
            'Finishing Engineer',
            'Construction Engineer',
          ],
          'image': 'Assets/engineers.jpg',
        },
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Design_Finishing,
        onBack: () => Navigator.pop(context),
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
              label: S.of(context).InteriorDesign,
              onTap: () => _navigateToDetails(context, categories[0]),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/building.png",
              label: S.of(context).Contracting,
              onTap: () => _navigateToDetails(context, categories[1]),
              screenWidth: screenWidth,
            ),
            _buildCategoryItem(
              imagePath: "Assets/architect.png",
              label: S.of(context).Engineers,
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
    final title = category['title'] as String? ?? 'Unknown';
    final details = category['details'] as Map<String, dynamic>? ?? {};

    if (title == 'Engineers') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineersScreen()),
      );
    } else if (title == 'Interior Design') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InteriorDesignCompanies(

          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContractingCompanies(),
        ),
      );
    }
  }
}

