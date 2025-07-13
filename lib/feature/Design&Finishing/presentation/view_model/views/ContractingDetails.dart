import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'Widgets/ContractinyObjects.dart';
import 'Widgets/OpenImage.dart';

class ContractingDetails extends StatefulWidget {
  final ContractingCompany company;

  const ContractingDetails({super.key, required this.company});

  @override
  _ContractingDetailsState createState() => _ContractingDetailsState();
}

class _ContractingDetailsState extends State<ContractingDetails> {
  final List<Map<String, dynamic>> _projects = [
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

  Widget ServicesSection() {
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
                "${widget.company.experience} ${S.of(context).yearsExperience}",
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
                widget.company.address,
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
                  widget.company.phone,
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

  Widget PreviousProjects() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Text(
            'Our Previous Projects',
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
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final project = _projects[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullScreenImage(
                          project["image"] as String, project["title"] as String),
                    ),
                  );
                },
                child: Container(
                  width: screenWidth * 0.6,
                  margin: EdgeInsets.only(
                    left: index == 0 ? screenWidth * 0.04 : screenWidth * 0.02,
                    right: index == _projects.length - 1
                        ? screenWidth * 0.04
                        : screenWidth * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
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
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8)),
                        child: Image.asset(
                          project["image"] as String,
                          width: screenWidth * 0.6,
                          height: screenWidth * 0.35,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project["title"] as String,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget DistinguishesUs() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final distinctions = [
      'High-quality materials ensure durability and aesthetics.',
      'Timely project delivery with strict adherence to schedules.',
      'Professional team with extensive industry experience.',
      'Eco-friendly practices for sustainable construction.',
    ];

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
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
            'What Distinguishes Us',
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          ...distinctions.map((distinction) => Padding(
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
                    distinction,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                backgroundImage: AssetImage(widget.company.image),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              widget.company.name,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ServicesSection(),
            SizedBox(height: screenHeight * 0.02),
            PreviousProjects(),
            SizedBox(height: screenHeight * 0.02),
            DistinguishesUs(),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}