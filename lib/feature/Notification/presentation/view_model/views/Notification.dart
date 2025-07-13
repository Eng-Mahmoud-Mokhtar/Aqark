import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../generated/l10n.dart';
import '../NotificationCubit.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<bool> notifications = [true];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NotificationCubit>().markAsSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Notification,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: notifications.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/Mail-amico.png', width: screenWidth * 0.6),
              SizedBox(height: screenHeight * 0.02),
              Text(
                S.of(context).NoNotification,
                style: TextStyle(
                  color:  SubText,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

            ],
          ),
        )
            : ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return _buildNotificationCard(context, screenWidth, index);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context, double screenWidth, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.white,
      elevation: 6,
      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Your plan is expiring soon!",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  color: backgroundColor,
                  onSelected: (value) {
                    if (value == 'delete') {
                      setState(() {
                        notifications.removeAt(index);
                      });
                    }
                  },
                  itemBuilder: (context) => [
                     PopupMenuItem(
                      value: 'delete',
                      child: Text(S.of(context).delete,style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                  icon: Icon(Icons.more_vert, color: SubText),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.01),
            Text(
              "1 day left. Renew to keep access.",
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: SubText,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

