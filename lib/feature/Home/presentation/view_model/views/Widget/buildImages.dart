import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit لإدارة تبديل الصور تلقائيًا
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

/// ويدجت عرض الصور مع التحريك السلس
class AnimatedImageSlider extends StatelessWidget {
  final List<String> images;
  const AnimatedImageSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageSliderCubit(images.length),
      child: _AnimatedImageSliderView(images: images),
    );
  }
}

class _AnimatedImageSliderView extends StatefulWidget {
  final List<String> images;
  const _AnimatedImageSliderView({required this.images});

  @override
  State<_AnimatedImageSliderView> createState() => _AnimatedImageSliderViewState();
}

class _AnimatedImageSliderViewState extends State<_AnimatedImageSliderView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BlocBuilder<ImageSliderCubit, int>(
          builder: (context, currentIndex) {
            _controller.forward(from: 0);
            return Stack(
              children: widget.images.asMap().entries.map((entry) {
                int index = entry.key;
                String imagePath = entry.value;
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: index == currentIndex ? 1.0 : 0.0,
                  child: Image.asset(
                    imagePath,
                    width: screenWidth,
                    height: screenWidth * 0.4,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
final List<String> homeImages = [
  'Assets/movie-night-by-pool-whole-family.jpg',
  'Assets/house-isolated-field.jpg',
  'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
  "Assets/modern-office-space-with-futuristic-decor-furniture.jpg",
];