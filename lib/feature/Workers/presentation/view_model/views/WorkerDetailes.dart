import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Design&Finishing/presentation/view_model/views/EngineerDetails.dart';
import 'Widgets/WorkerObjects.dart';

class WorkerDetailsScreen extends StatelessWidget {
  final Worker worker;

  const WorkerDetailsScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).WorkerProfile,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: AssetImage(worker.image),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              worker.name,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildDetailsSection(context),
            SizedBox(height: screenHeight * 0.02),
            _buildPortfolioSection(context),
            SizedBox(height: screenHeight * 0.02),
            _buildWorkExperienceSection(context),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.work_outline, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.02),
              Text(
                worker.profession,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            children: [
              Icon(Icons.access_time, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.02),
              Text(
                "${worker.experience} ${S.of(context).yearsExperience}",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.02),
              Text(
                worker.address,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            children: [
              Icon(Icons.phone_outlined, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.02),
              GestureDetector(
                onTap: () {},
                child: Text(
                  worker.phone,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: KprimaryColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> portfolio = [
      {
        "image": "Assets/side-view-man-working-as-plumber.jpg",
        "title": "Outdoor Tiling",
      },
      {
        "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
        "title": "Kitchen Plumbing",
      },
      {
        "image": "Assets/carpenter-works-with-tree.jpg",
        "title": "Bathroom Leak Fix",
      },
      {
        "image": "Assets/side-view-man-working-as-plumber.jpg",
        "title": "Patio Tiling",
      },
      {
        "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
        "title": "Electrical Rewiring",
      },
      {
        "image": "Assets/carpenter-works-with-tree.jpg",
        "title": "Custom Furniture",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Text(
            "Portfolio",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        SizedBox(
          height: screenWidth * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            itemCount: portfolio.length,
            itemBuilder: (context, index) {
              final project = portfolio[index];
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FullScreenImage(project['image'] as String, project['title'] as String),
                        ),
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            child: Image.asset(
                              project['image'] as String,
                              width: screenWidth * 0.6,
                              height: screenWidth * 0.35,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: screenWidth * 0.6,
                                height: screenWidth * 0.35,
                                color: Colors.grey[200],
                                child: Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    color: Colors.grey,
                                    size: screenWidth * 0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text(
                              project['title'] as String,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (index < portfolio.length - 1) SizedBox(width: screenWidth * 0.04),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWorkExperienceSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final projects = [
      'Tiling work for residential buildings in Cairo.',
      'Plumbing installations for commercial kitchens.',
      'Custom furniture crafting for luxury homes.',
      'Electrical wiring for office spaces in Giza.',
    ];

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Experience",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          ...projects.map((project) => Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.01),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: screenWidth * 0.05,
                  color: KprimaryColor,
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    project,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
