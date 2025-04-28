import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback? onSearch;
  final bool showSearch;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBack,
    this.onSearch,
    this.showSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color: Colors.black, size: screenHeight * 0.025),
        onPressed: onBack,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: showSearch
          ? [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: Image.asset(
                'Assets/icons-search-.png',
                width: screenWidth * 0.05,
                height: screenWidth * 0.05,
                fit: BoxFit.contain,
                color: Colors.grey.shade900,
              ),
              onPressed: onSearch ?? () {},
            ),
          ),
        ),
      ]
          : [],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.5),
        child: Container(
          color: const Color(0xffE9E9E9),
          height: 1.5,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
