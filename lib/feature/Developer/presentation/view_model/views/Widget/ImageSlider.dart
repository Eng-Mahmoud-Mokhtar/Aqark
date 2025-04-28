import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'PriceCard.dart';
import 'ProjectObjects.dart';

class ImageSliderCubit extends Cubit<int> {
  final int totalImages;
  Timer? _timer;

  ImageSliderCubit(this.totalImages) : super(0) {
    _startSlideShow();
  }

  void _startSlideShow() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      nextImage();
    });
  }

  void nextImage() {
    emit((state + 1) % totalImages);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

class ImageSlider extends StatefulWidget {
  final Project project;
  final String developerLogo;
  final String developerName;
  final String PricesStart;
  final String ResaleStart;

  const ImageSlider({
    required this.project,
    required this.developerLogo,
    required this.developerName,
    required this.PricesStart,
    required this.ResaleStart,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final imageHeight = screenWidth * 0.7;

    return BlocProvider(
      create: (_) => ImageSliderCubit(widget.project.images.length),
      child: Stack(
        children: [
          SizedBox(
            height: imageHeight,
            width: screenWidth,
            child: ClipRRect(
              child: BlocBuilder<ImageSliderCubit, int>(
                builder: (context, currentIndex) {
                  _controller.forward(from: 0);
                  return Stack(
                    children: widget.project.images.asMap().entries.map((entry) {
                      int index = entry.key;
                      String imagePath = entry.value;
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 800),
                        opacity: index == currentIndex ? 1.0 : 0.0,
                        child: Image.asset(
                          imagePath,
                          width: screenWidth,
                          height: imageHeight,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          Positioned(
            top: screenWidth * 0.04,
            left: screenWidth * 0.04,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.025,
                vertical: screenWidth * 0.006,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    widget.project.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top:screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.ios_share,
                      color: Colors.white,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
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
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenWidth * 0.3,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Container(
                    width: screenWidth * 0.14,
                    height: screenWidth * 0.14,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        widget.developerLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Text(
                    "${widget.project.name} in ${widget.project.location} by ${widget.developerName} developers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // بطاقة الأسعار
          Positioned(
            bottom: screenWidth * 0.01,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: PriceCard(
              pricesStart: widget.PricesStart,
              resaleStart: widget.ResaleStart,
            ),
          ),
        ],
      ),
    );
  }
}
