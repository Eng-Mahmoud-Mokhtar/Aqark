import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'Widgets/EngineerObjects.dart';

class EngineerDetailsScreen extends StatelessWidget {
  final Engineer engineer;

  const EngineerDetailsScreen({Key? key, required this.engineer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).EngineerProfile,
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
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: AssetImage(engineer.image),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              engineer.name,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildAboutSection(context),
            SizedBox(height: screenHeight * 0.02),
            _buildPortfolioSection(context),
            SizedBox(height: screenHeight * 0.02),
            _buildProjectsWorkedOn(context),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
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
              Icon(Icons.access_time, size: screenWidth * 0.04),
              SizedBox(width: screenWidth * 0.02),
              Text(
                "${engineer.experience} ${S.of(context).yearsExperience}",
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
                engineer.address,
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
                  engineer.phone,
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
        "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
        "title": "Residential Building",
      },
      {
        "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
        "title": "Commercial Complex",
      },
      {
        "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
        "title": "Renovation Project",
      },
      {
        "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
        "title": "Industrial Warehouse",
      },
      {
        "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
        "title": "Sustainable Villa",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Text(
            'Portfolio',
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Consistent padding on both sides
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
                  if (index < portfolio.length - 1) SizedBox(width: screenWidth * 0.04), // Spacing between items
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsWorkedOn(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final projects = [
      'Residential building renovations in Cairo.',
      'Commercial office space design and finishing.',
      'Eco-friendly villa construction projects.',
      'High-end interior design for luxury apartments.',
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
            'Work Experience',
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

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String title;

  const FullScreenImage(this.imagePath, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white, size: screenHeight * 0.025),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}