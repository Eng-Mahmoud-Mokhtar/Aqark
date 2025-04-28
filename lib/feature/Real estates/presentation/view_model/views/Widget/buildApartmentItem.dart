import 'package:flutter/material.dart';
import '../../../../../../core/utiles/DetailesProperty.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../generated/l10n.dart';
import 'RealStateObjects.dart';
import 'buildDetailsRow.dart';
import 'buildLocationRow.dart';
import 'buildPriceRow.dart';

Widget buildApartmentItem(BuildContext context, RealStateObjects apartment) {
  final screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailesProperty(
            name: apartment.name,
            type: apartment.type,
            images: apartment.images,
            location: apartment.location,
            address: apartment.address,
            baths: apartment.baths,
            beds: apartment.beds,
            size: apartment.size,
            price: apartment.price,
            description: apartment.description,
            finishingType: apartment.finishingType,
            listingDate: apartment.listingDate,
            ownerNumber: apartment.ownerNumber,
            deliveryType: apartment.deliveryType,
            PaymentDetails: apartment.PaymentDetails,
          ),
        ),
      );
    },
    child: Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.01),
                child: Image.asset(
                  apartment.images[0],
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: screenWidth * 0.4,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.3,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: IconButton(
                          icon: Icon(
                            apartment.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                            apartment.isFavorite ? Colors.red : SubText,
                            size: screenWidth * 0.1,
                          ),
                          onPressed: () {
                            // Handle favorite logic here
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        apartment.name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: const Color(0xff2F2F2F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenWidth * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: apartment.isForRent
                            ? SecondaryColor
                            : KprimaryColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        apartment.isForRent
                            ? S.of(context).for_rent
                            : S.of(context).for_sale,
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                buildLocationRow(
                    screenWidth, apartment.address, apartment.location),
                SizedBox(height: screenWidth * 0.01),
                buildDetailsRow(
                    context,
                    screenWidth,
                    apartment.baths.toString(),
                    apartment.beds.toString(),
                    apartment.size.toString()),
                SizedBox(height: screenWidth * 0.01),
                buildPriceRow(screenWidth, apartment.price,
                    apartment.ownerNumber, context),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
