import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
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
  final TextEditingController _editReviewController = TextEditingController();
  int? _editingIndex;
  final FocusNode _editFocusNode = FocusNode();
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
  final List<Map<String, dynamic>> _posts = [
    {
      "image": "Assets/side-view-man-working-as-plumber.jpg",
      "title": "Outdoor Tiling",
      "caption": "Completed outdoor tiling work for a villa entrance in Jeddah.",
      "date": "March 2025",
    },
    {
      "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
      "title": "Kitchen Plumbing",
      "caption": "Installed a full water system for a modern kitchen in Riyadh.",
      "date": "April 2025",
    },
    {
      "image": "Assets/carpenter-works-with-tree.jpg",
      "title": "Bathroom Leak Fix",
      "caption": "Fixed a pipe leak and installed new faucets in a guest bathroom.",
      "date": "February 2025",
    },
    {
      "image": "Assets/side-view-man-working-as-plumber.jpg",
      "title": "Patio Tiling",
      "caption": "Tiled a large patio area for a residence in Dammam.",
      "date": "January 2025",
    },
    {
      "image": "Assets/man-electrical-technician-working-switchboard-with-fuses.jpg",
      "title": "Electrical Rewiring",
      "caption": "Rewired an office building in Jeddah for improved safety.",
      "date": "December 2024",
    },
    {
      "image": "Assets/carpenter-works-with-tree.jpg",
      "title": "Custom Furniture",
      "caption": "Crafted custom wooden furniture for a home in Riyadh.",
      "date": "November 2024",
    },
  ];
  String getTranslatedProfession(BuildContext context, String professionId) {
    switch (professionId) {
      case 'mason':
        return S.of(context).Mason;
      case 'plumber':
        return S.of(context).Plumber;
      case 'carpenter':
        return S.of(context).Carpenter;
      case 'electrician':
        return S.of(context).Electrician;
      case 'painter':
        return S.of(context).Painter;
      case 'ac_technician':
        return S.of(context).ACTechnician;
      default:
        return professionId;
    }
  }
  bool _isReviewComplete = false;

  void initState() {
    super.initState();
    _reviewController.addListener(_updateReviewStatus);
  }

  @override
  void dispose() {
    _reviewController.removeListener(_updateReviewStatus);
    _reviewController.dispose();
    _editReviewController.dispose();
    _editFocusNode.dispose();
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
          "user": "User",
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
  void _startEditing(int index, Map<String, dynamic> review) {
    setState(() {
      _editingIndex = index;
      _editReviewController.text = review["comment"];
      _editFocusNode.requestFocus();
    });
  }

  void _saveEdit(int index) {
    if (_editReviewController.text.isNotEmpty) {
      setState(() {
        _reviews[index]["comment"] = _editReviewController.text;
        _editingIndex = null;
        _editReviewController.clear();
      });
    }
  }

  void _deleteReview(int index) {
    setState(() {
      _reviews.removeAt(index);
      _editingIndex = null;
      _editReviewController.clear();
    });
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
                      Text(
                        post["date"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: SubText,
                        ),
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
                  fontSize: screenWidth * 0.035,
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
        Padding(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
          ),
          child: Column(
            children: _reviews.asMap().entries.map((entry) {
              final index = entry.key;
              final review = entry.value;
              return Container(
                margin: EdgeInsets.only(bottom: screenWidth * 0.02),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.06,
                          backgroundImage: AssetImage(review["avatar"]),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    review["user"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  _buildRatingIndicator(review["rating"]),
                                ],
                              ),
                              PopupMenuButton<String>(
                                color: Colors.white,
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                  size: screenWidth * 0.05,
                                ),
                                onSelected: (value) {
                                  if (value == S.of(context).edit) {
                                    _startEditing(index, review);
                                  } else if (value == S.of(context).delete) {
                                    _deleteReview(index);
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem<String>(
                                    value: S.of(context).edit,
                                    child: Text(
                                      S.of(context).edit,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: S.of(context).delete,
                                    child: Text(
                                      S.of(context).delete,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _editingIndex == index
                        ? ValueListenableBuilder(
                      valueListenable: _editReviewController,
                      builder: (context, TextEditingValue value, child) {
                        final isEmpty = value.text.isEmpty;
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: screenWidth * 0.12,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAFAFA),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xffE9E9E9),
                                  ),
                                ),
                                child: TextField(
                                  controller: _editReviewController,
                                  focusNode: _editFocusNode,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: screenWidth * 0.032,
                                      horizontal: screenWidth * 0.02,
                                    ),
                                    hintText: S.of(context).WriteYourReview,
                                    hintStyle: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  maxLines: null,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.send,
                                color: isEmpty ? Colors.grey : KprimaryColor,
                                size: screenWidth * 0.06,
                              ),
                              onPressed: isEmpty ? null : () => _saveEdit(index),
                            ),
                          ],
                        );
                      },
                    )
                        : Text(
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
        title: S.of(context).WorkerProfile,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
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
                  getTranslatedProfession(context, widget.worker.profession),
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
                      Icon(Icons.work_outline, size: screenWidth * 0.04),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "${widget.worker.experience} ${S.of(context).yearsExperience}",
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
                      Icon(
                        Icons.phone_outlined,
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Text(
                          widget.worker.phone,
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
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      Icon(Icons.star_outline, size: screenWidth * 0.04),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        '${S.of(context).Rating} : ${widget.worker.rating}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        ),
                        child: Center(
                          child: Text(
                            "${S.of(context).Posts} (${_posts.length})",
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
                            "${S.of(context).Reviews} (${_reviews.length})",
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