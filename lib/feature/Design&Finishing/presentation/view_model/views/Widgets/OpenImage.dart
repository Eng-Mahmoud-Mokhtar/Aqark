import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String title;

  const FullScreenImage(this.imagePath, this.title, {super.key});

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