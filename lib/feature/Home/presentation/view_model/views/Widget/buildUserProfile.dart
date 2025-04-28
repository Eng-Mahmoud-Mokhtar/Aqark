import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Notification/presentation/view_model/views/Notification.dart';

Widget buildUserProfile(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  const String imagePath = 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG';
  final ImageProvider userImage = AssetImage(imagePath);
  precacheImage(userImage, context);

  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: FadeInImage(
          placeholder: const AssetImage('Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG'),
          image: userImage,
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
          fadeInCurve: Curves.easeIn,
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).welcome,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            S.of(context).best,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ],
      ),
      const Spacer(),
      IconButton(
        icon: Icon(
          Icons.notifications_none_rounded,
          color: KprimaryColor,
          size: screenWidth * 0.07,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationPage(),
            ),
          );
        },
      ),
    ],
  );
}
