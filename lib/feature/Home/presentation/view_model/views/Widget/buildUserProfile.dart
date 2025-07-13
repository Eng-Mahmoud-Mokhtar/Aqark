import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../Notification/presentation/view_model/NotificationCubit.dart';
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
          placeholder: AssetImage(imagePath),
          image: userImage,
          width: screenWidth * 0.13,
          height: screenWidth * 0.13,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(width: 10),
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
              color: SubText,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ],
      ),
      Spacer(),
      Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: KprimaryColor,
              size: screenWidth * 0.07,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationPage()),
              );
            },
          ),
          BlocBuilder<NotificationCubit, bool>(
            builder: (context, hasUnreadNotification) {
              return hasUnreadNotification
                  ? Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: screenWidth * 0.025,
                  height: screenWidth * 0.025,
                  decoration: BoxDecoration(
                    color: SecondaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    ],
  );
}
