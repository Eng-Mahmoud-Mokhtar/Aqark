import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class PriceCard extends StatelessWidget {
  final String pricesStart;
  final String resaleStart;

  const PriceCard({
    required this.pricesStart,
    required this.resaleStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PriceColumn(title: S.of(context).DeveloperStartPrice, value: pricesStart),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          PriceColumn(title:S.of(context).ResaleStartPrice, value: resaleStart),
        ],
      ),
    );
  }
}

class PriceColumn extends StatelessWidget {
  final String title;
  final String value;

  const PriceColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.025,
              color: SubText,

            ),
          ),
          Text(
            value,
            style:  TextStyle(
              fontSize: screenWidth * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}