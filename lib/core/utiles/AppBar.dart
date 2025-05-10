import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';

import '../../feature/Home/presentation/view_model/views/Search.dart';
import '../../feature/Home/presentation/view_model/views/Widget/buildSearchBar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  final bool showSearch;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBack,
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
          padding: EdgeInsetsDirectional.only(
            start: screenWidth * 0.008,
            end: 0,
            top: screenWidth * 0.02,
            bottom: screenWidth * 0.02,
          ),
          child: Container(
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: IconButton(
              icon: Image.asset(
                'Assets/icons-search-.png',
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                fit: BoxFit.contain,
                color: Colors.grey.shade600,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Search()),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: screenWidth * 0.015,
            end: screenWidth * 0.04,
            top: screenWidth * 0.02,
            bottom: screenWidth * 0.02,
          ),
          child: Container(
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: IconButton(
              icon: Image.asset(
                'Assets/icons8-filter-48.png',
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                color: Colors.grey.shade600,
                fit: BoxFit.contain,
              ),
              onPressed: () {
                showFilterBottomSheet(context);
              },
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
