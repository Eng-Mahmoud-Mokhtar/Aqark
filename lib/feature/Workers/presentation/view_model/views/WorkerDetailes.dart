import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import 'Workers.dart';

class WorkerDetailsScreen extends StatefulWidget {
  final Worker worker;

  const WorkerDetailsScreen({super.key, required this.worker});

  @override
  _WorkerDetailsScreenState createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  int _currentTabIndex = 0;
  double _selectedRating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, dynamic>> _reviews = [
    {
      "user": "John Smith",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.5,
      "comment": "Excellent service! Very professional worker.",
      "date": "2 days ago"
    },
    {
      "user": "Sarah Johnson",
      "avatar": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 5.0,
      "comment": "Highly recommended! Knowledgeable and patient.",
      "date": "1 week ago"
    },
  ];

  final List<Map<String, dynamic>> _posts = List.generate(6, (index) {
    final data = [
      {
        "image": "Assets/side-view-man-working-as-plumber.jpg",
        "title": "Outdoor Tiling",
        "caption": "Completed outdoor tiling work for a villa entrance in Jeddah.",
        "likes": 1,
        "liked": false,
        "date": "March 2025",
      },
      {
        "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
        "title": "Kitchen Plumbing",
        "caption": "Installed a full water system for a modern kitchen in Riyadh.",
        "likes": 5,
        "liked": false,
        "date": "April 2025",
      },
      {
        "image": "Assets/carpenter-works-with-tree.jpg",
        "title": "Bathroom Leak Fix",
        "caption": "Fixed a pipe leak and installed new faucets in a guest bathroom.",
        "likes": 10,
        "liked": false,
        "date": "February 2025",
      },
      {
        "image": "Assets/side-view-man-working-as-plumber.jpg",
        "title": "Outdoor Tiling",
        "caption": "Completed outdoor tiling work for a villa entrance in Jeddah.",
        "likes": 1,
        "liked": false,
        "date": "March 2025",
      },
      {
        "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
        "title": "Kitchen Plumbing",
        "caption": "Installed a full water system for a modern kitchen in Riyadh.",
        "likes": 5,
        "liked": false,
        "date": "April 2025",
      },
      {
        "image": "Assets/carpenter-works-with-tree.jpg",
        "title": "Bathroom Leak Fix",
        "caption": "Fixed a pipe leak and installed new faucets in a guest bathroom.",
        "likes": 10,
        "liked": false,
        "date": "February 2025",
      },
    ];
    return data[index];
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

  Widget _buildPostsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: _posts.asMap().entries.map((entry) {
        final index = entry.key;
        final post = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index == _posts.length - 1 ? 0 : screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullScreenImage(post["image"], post["title"]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      post["image"],
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth * 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post["title"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                  Text(
                          post["caption"],
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey[700],
                          ),
                        ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post["date"],
                            style: TextStyle(
                              fontSize: screenWidth * 0.025,
                              color:SubText,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                post["liked"] = !(post["liked"] ?? false);
                                if (post["liked"]) {
                                  post["likes"] += 1;
                                } else {
                                  post["likes"] -= 1;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  (post["liked"] ?? false)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: (post["liked"] ?? false) ? Colors.red : SubText,
                                  size: screenWidth * 0.05,
                                ),
                                SizedBox(width: 4),
                                if (post["likes"] > 0)
                                  Text(
                                    post["likes"].toString(),
                                    style: TextStyle(
                                      color: SubText,
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
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

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Worker Profile',
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
                  backgroundImage: AssetImage(widget.worker.image),
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.worker.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      widget.worker.profession,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: KprimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // About Section
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
                        "Details",
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
                            widget.worker.experience,
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
                            widget.worker.address,
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
                            'Rating: (${widget.worker.rating})',
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
                        "Professional worker with years of experience in ${widget.worker.profession.toLowerCase()}. "
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
                                "Posts (${_posts.length})",
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
                                "Reviews (${_reviews.length})",
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
                _currentTabIndex == 0 ? _buildPostsTab() : _buildReviewsTab(),
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

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String Title;

  const FullScreenImage(this.imagePath,this.Title, {super.key});

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
          icon: Icon(Icons.close,
              color: Colors.white, size: screenHeight * 0.025),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          Title,
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