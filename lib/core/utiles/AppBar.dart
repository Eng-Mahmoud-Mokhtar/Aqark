import 'package:flutter/material.dart';
import 'package:bk/core/utiles/constans.dart';
import '../../feature/Home/presentation/view_model/views/Search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  final bool showSearch;
  final VoidCallback? onPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBack,
    this.onPressed,
    this.showSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: mq.width * 0.05),
        onPressed: onBack,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: mq.width * 0.035,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (showSearch)
          Padding(
            padding: EdgeInsetsDirectional.only(end: mq.width * 0.02),
            child: SizedBox(
              height: mq.width * 0.1,
              width: mq.width * 0.1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(mq.width * 0.02),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'Assets/icons-search-.png',
                    width: mq.width * 0.055,
                    height: mq.width * 0.055,
                    color: Colors.grey.shade600,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Search()),
                    );
                  },
                ),
              ),
            ),
          ),
        if (onPressed != null)
          Padding(
            padding: EdgeInsetsDirectional.only(end: mq.width * 0.04),
            child: SizedBox(
              height: mq.width * 0.1,
              width: mq.width * 0.1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(mq.width * 0.02),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'Assets/icons8-filter-48.png',
                    width: mq.width * 0.05,
                    height: mq.width * 0.05,
                    color: Colors.grey.shade600,
                    fit: BoxFit.contain,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(mq.height * 0.0025),
        child: Divider(height: mq.height * 0.0025, color: const Color(0xffE9E9E9)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
