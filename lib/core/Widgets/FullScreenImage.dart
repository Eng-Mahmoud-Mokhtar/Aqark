import 'package:flutter/material.dart';
import '../utiles/constans.dart';

class FullScreenProperty extends StatelessWidget {
  final List<String> images;
  final int initialIndex;
  final String name;

  const FullScreenProperty({
    Key? key,
    required this.images,
    required this.initialIndex,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        toolbarHeight: screenHeight * 0.1, // تأكيد ارتفاع مناسب
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: screenHeight * 0.03,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      '${images.length} Photos',
                      style: TextStyle(
                        color: SubText,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PageView.builder(
            controller: PageController(initialPage: initialIndex),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                ),
              );
            },
          );
        },
      ),
    );
  }
}