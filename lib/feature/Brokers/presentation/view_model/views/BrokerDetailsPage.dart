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
  int _currentTabIndex = 0;
  double _selectedRating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, dynamic>> _reviews = [
    {
      "user": "John Smith",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.5,
      "comment":
          "Excellent service! Very professional broker who helped me find my dream home quickly. The whole process was smooth and efficient.",
      "date": "2 days ago"
    },
    {
      "user": "Sarah Johnson",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 5.0,
      "comment":
          "Highly recommended! Knowledgeable and patient throughout the entire process. Went above and beyond to find the perfect property for my family.",
      "date": "1 week ago"
    },
  ];

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
          });
  bool _isReviewComplete = false;
  @override
  void initState() {
    super.initState();
    _reviewController.addListener(_updateReviewStatus);
  }
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
  void _updateReviewStatus() {
    setState(() {
      _isReviewComplete =
          _selectedRating > 0 && _reviewController.text.isNotEmpty;
    });
  }
  void _submitReview() {
    if (_isReviewComplete) {
      setState(() {
        _reviews.insert(0, {
          "user": "User",
          "avatar": "Assets/Screenshot (13).png",
          "rating": _selectedRating,
          "comment": _reviewController.text,
          "date": "Just now"
        });
        _selectedRating = 0.0;
        _reviewController.clear();
        _isReviewComplete = false;
      });
    }
  }
  Widget _buildStarRating() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRating = index + 1.0;
              _updateReviewStatus();
            });
          },
          child: Icon(
            index < _selectedRating.floor()
                ? Icons.star
                : (index < _selectedRating
                    ? Icons.star_half
                    : Icons.star_border),
            size: screenWidth * 0.06,
            color: SecondaryColor,
          ),
        );
      }),
    );
  }
  Widget _buildRatingIndicator(double rating) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(
            rating.floor(),
            (i) => Icon(Icons.star,
                size: screenWidth * 0.04, color: SecondaryColor),
          ),
        ),
        if (rating % 1 >= 0.5)
          Icon(Icons.star_half,
              size: screenWidth * 0.04, color: SecondaryColor),
        Row(
          children: List.generate(
            5 - rating.ceil(),
            (i) => Icon(Icons.star_border,
                size: screenWidth * 0.04, color: SecondaryColor),
          ),
        ),
        SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
  Widget _buildListingsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
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
            onTap: () {
              _navigateToPropertyDetails(listing);
            },
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
                                listing["isFavorite"]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: listing["isFavorite"]
                                    ? Colors.red
                                    : SubText,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04,
                                vertical: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                S.of(context).for_rent,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.025,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: screenWidth * 0.04,
                                color: SecondaryColor),
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
                            ]),
                        SizedBox(height: screenWidth * 0.01),
                        Text(
                          '${listing["price"]} ${S.of(context).EGP}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: SecondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )
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
  void _navigateToPropertyDetails(Map<String, dynamic> property) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Property Details"),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  property["image"],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  property["title"],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(property["location"]),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    _buildDetailItem(
                        Icons.bathtub, "${property["baths"]} Baths"),
                    SizedBox(width: 16),
                    _buildDetailItem(
                        Icons.king_bed, "${property["beds"]} Beds"),
                    SizedBox(width: 16),
                    _buildDetailItem(
                        Icons.aspect_ratio, "${property["size"]} m²"),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(property["description"]),
                SizedBox(height: 16),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                _buildDetailRow("Type", property["type"]),
                _buildDetailRow("Finishing Type", property["finishingType"]),
                _buildDetailRow("Listing Date", property["listingDate"]),
                _buildDetailRow("Delivery Type", property["deliveryType"]),
                _buildDetailRow("Payment", property["paymentDetails"]),
                _buildDetailRow("Contact", property["ownerNumber"]),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: SubText),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
  Widget _buildReviewsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: screenHeight * 0.26,
          margin: EdgeInsets.all(screenWidth * 0.04),
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Text(
                "Add Your Review",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _buildStarRating(),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffE9E9E9)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _reviewController,
                        decoration: InputDecoration(
                          hintText: "Write your review",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.035,
                            horizontal: screenWidth * 0.02,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send,
                          color: _isReviewComplete ? KprimaryColor : SubText,
                          size: screenWidth * 0.06),
                      onPressed: _isReviewComplete ? _submitReview : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: _reviews.map((review) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02,
              ),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundImage: review["user"] == "User"
                            ? AssetImage("Assets/Screenshot (13).png")
                            : AssetImage(review["avatar"]),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  review["user"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                                Text(
                                  review["date"],
                                  style: TextStyle(
                                    color: SubText,
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth * 0.01),
                            _buildRatingIndicator(review["rating"]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    review["comment"],
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Broker Profile',
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04),
                Hero(
                  tag: 'broker-avatar-${widget.broker["name"]}',
                  child: CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: AssetImage(widget.broker["image"]),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.broker["name"],
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: SecondaryColor,
                          size: screenWidth * 0.045,
                        ),
                        Text(
                          "${widget.broker["location"]}, ${widget.broker["city"]}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: SubText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenWidth * 0.12,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _currentTabIndex == 0
                                  ? KprimaryColor
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Center(
                              child: Text(
                                "${_listings.length} Listing${_listings.length == 1 ? '' : 's'}",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: _currentTabIndex == 0
                                      ? Colors.white
                                      : KprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _currentTabIndex == 1
                                  ? KprimaryColor
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Center(
                              child: Text(
                                "${_reviews.length} Review${_reviews.length == 1 ? '' : 's'}",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: _currentTabIndex == 1
                                      ? Colors.white
                                      : KprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _currentTabIndex == 0
                    ? _buildListingsTab()
                    : _buildReviewsTab(),
                SizedBox(height: screenWidth * 0.08),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: KprimaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                color: KprimaryColor,
                                size: screenWidth * 0.06,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                'Call Us',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xff06cd46e),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'Assets/logos_whatsapp-icon.png',
                                height: screenWidth * 0.12,
                                width: screenWidth * 0.12,

                              ),
                              Text(
                                'WhatsApp',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
