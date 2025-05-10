import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/AppBar.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../Materials.dart';

class ShopDetailsScreen extends StatefulWidget {
  final MaterialShop shop;

  const ShopDetailsScreen({Key? key, required this.shop}) : super(key: key);

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  int _currentTabIndex = 0;
  double _selectedRating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, dynamic>> _reviews = [
    {
      "user": "John Smith",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.5,
      "comment": "Excellent shop! Very professional service.",
      "date": "2 days ago"
    },
    {
      "user": "Sarah Johnson",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 5.0,
      "comment": "Highly recommended! Great quality products.",
      "date": "1 week ago"
    },
  ];

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
      _isReviewComplete = _selectedRating > 0 && _reviewController.text.isNotEmpty;
    });
  }

  void _submitReview() {
    if (_isReviewComplete) {
      setState(() {
        _reviews.insert(0, {
          "user": "You",
          "avatar": "Assets/user_avatar.png",
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

  // Helper method to get localized shop type name
  String getCategoryDisplayName(BuildContext context, String category) {
    switch (category) {
      case 'All':
        return S.of(context).all;
      case 'Cement':
        return S.of(context).Cement;
      case 'Bricks':
        return S.of(context).Bricks;
      case 'Steel':
        return S.of(context).Steel;
      case 'Paints':
        return S.of(context).Paints;
      case 'Tiles':
        return S.of(context).Tiles;
      case 'Plumbing':
        return S.of(context).Plumbing;
      case 'Electrical':
        return S.of(context).Electrical;
      default:
        return category;
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
                : (index < _selectedRating ? Icons.star_half : Icons.star_border),
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
                (i) => Icon(Icons.star, size: screenWidth * 0.04, color: SecondaryColor),
          ),
        ),
        if (rating % 1 >= 0.5)
          Icon(Icons.star_half, size: screenWidth * 0.04, color: SecondaryColor),
        Row(
          children: List.generate(
            5 - rating.ceil(),
                (i) => Icon(Icons.star_border, size: screenWidth * 0.04, color: SecondaryColor),
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

  Widget _buildProductsTab() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.80,
        ),
        itemCount: widget.shop.products.length,
        itemBuilder: (context, index) {
          final product = widget.shop.products[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: screenWidth * 0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${product.price}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: SecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
                S.of(context).AddYourReview,
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
                          hintText: S.of(context).WriteYourReview,
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
                        backgroundImage: AssetImage(review["avatar"]),
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

    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: widget.shop.name,
          onBack: () => Navigator.pop(context),
          showSearch: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: AssetImage(widget.shop.image),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    widget.shop.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth,
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
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Icon(Icons.work_outline, size: screenWidth * 0.04),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              getCategoryDisplayName(context, widget.shop.type),
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
                              widget.shop.address,
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
                            Icon(Icons.star_outline, size: screenWidth * 0.04),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              '${S.of(context).Rating} ${widget.shop.rating}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Professional worker with years of experience in ${widget.shop.name.toLowerCase()}. "
                              "Provides high quality services with attention to details and customer satisfaction.",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Tabs
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
                                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                              ),
                              child: Center(
                                child: Text(
                                  "${S.of(context).Products} ${widget.shop.products.length}",
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
                                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                              ),
                              child: Center(
                                child: Text(
                                  "${S.of(context).Reviews} ${_reviews.length}",
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
                  _currentTabIndex == 0 ? _buildProductsTab() : _buildReviewsTab(),
                  SizedBox(height: screenWidth * 0.15),
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
                                  S.of(context).CallUs,
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
                            color: Color(0xff25D366),
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
                                  S.of(context).WhatsApp,
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
            ),
          ],
        ),
      ),
    );
  }
}