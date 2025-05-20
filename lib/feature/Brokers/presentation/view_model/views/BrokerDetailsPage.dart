import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class BrokerDetailsPage extends StatefulWidget {
  final Map<String, dynamic> broker;

  const BrokerDetailsPage({super.key, required this.broker});

  @override
  _BrokerDetailsPageState createState() => _BrokerDetailsPageState();
}

class _BrokerDetailsPageState extends State<BrokerDetailsPage> {
  final List<Map<String, dynamic>> _listings = List.generate(
    5,
        (index) => {
      "isFavorite": false,
      "image": "Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg",
      "title": "Luxury Apartment ${index + 1}",
      "location": "Cairo, Street, ${index + 15}",
      "baths": 2,
      "beds": 3 + index,
      "size": 150 + (index * 20),
      "price": 1800000 + (index * 100000),
      "description": "This is a detailed description of property ${index + 1} with all features and amenities",
      "type": "Apartment",
      "finishingType": "High End",
      "listingDate": "2023-06-${10 + index}",
      "ownerNumber": "0101234567${index}",
      "deliveryType": "Ready",
      "paymentDetails": "Cash or Installment"
    },
  );

  Widget _buildListingsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listings.asMap().entries.map((entry) {
        final index = entry.key;
        final listing = entry.value;
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == _listings.length - 1 ? 0 : screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.asset(
                          listing["image"],
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: screenWidth * 0.4,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              listing["isFavorite"] = !listing["isFavorite"];
                            });
                          },
                          child: Container(
                            width: screenWidth * 0.1,
                            height: screenWidth * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                listing["isFavorite"] ? Icons.favorite : Icons.favorite_border,
                                color: listing["isFavorite"] ? Colors.red : SubText,
                                size: screenWidth * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                listing["title"],
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: const Color(0xff2F2F2F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                            SizedBox(width: screenWidth * 0.01),
                            Expanded(
                              child: Text(
                                listing["location"],
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: const Color(0xff9E9E9E),
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.01,
                                vertical: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: KprimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'Assets/icons8-bathtub-48.png',
                                    width: screenWidth * 0.05,
                                    height: screenWidth * 0.05,
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Text(
                                    listing["baths"].toString(),
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      color: KprimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.01,
                                vertical: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: KprimaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'Assets/icons8-bedroom-50.png',
                                    width: screenWidth * 0.05,
                                    height: screenWidth * 0.05,
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Text(
                                    listing["beds"].toString(),
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      color: KprimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              '|',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Image.asset(
                              'Assets/icons8-enlarge-30.png',
                              width: screenWidth * 0.04,
                              height: screenWidth * 0.04,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              '${listing["size"]} ${S.of(context).m}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: const Color(0xff9E9E9E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Text(
                          '${listing["price"]} ${S.of(context).EGP}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: SecondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).BrokerProfile,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Hero(
                tag: 'broker-avatar-${widget.broker["name"] ?? "unknown"}',
                child: CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: AssetImage(widget.broker["image"] ?? 'Assets/default_broker.png'),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                widget.broker["name"] ?? "Unknown Broker",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Details,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline,
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "${widget.broker["experience"] ?? "5"} ${S.of(context).yearsExperience}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
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
                        "${widget.broker["location"] ?? "Unknown"}, ${widget.broker["city"] ?? "Unknown"}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          widget.broker["phone"] ?? "01012345678",
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
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Text(
                S.of(context).Listing,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildListingsTab(),
            SizedBox(height: screenWidth * 0.02),
          ],
        ),
      ),
    );
  }
}