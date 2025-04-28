import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/Real estates/presentation/view_model/views/SuggestProperties.dart';
import 'AppBar.dart';
import 'buildInfoRow.dart';
import '../../generated/l10n.dart';
import 'FullScreenImage.dart';
import 'constans.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit() : super(false);

  void toggleFavorite() {
    emit(!state);
  }
}

class DetailesProperty extends StatelessWidget {
  final String name;
  final String type;
  final List<String> images;
  final String location;
  final String address;
  final int baths;
  final int beds;
  final int size;
  final String price;
  final String description;
  final String finishingType;
  final String ownerNumber;
  final String listingDate;
  final String deliveryType;
  final String PaymentDetails;


  const DetailesProperty({
    Key? key,
    required this.name,
    required this.type,
    required this.images,
    required this.location,
    required this.address,
    required this.baths,
    required this.beds,
    required this.size,
    required this.price,
    required this.description,
    required this.finishingType,
    required this.ownerNumber,
    required this.listingDate,
    required this.deliveryType,
    required this.PaymentDetails
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: name,
          onBack: () => Navigator.pop(context),
          onSearch: () {},
          showSearch: false,
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return BlocBuilder<FavoriteCubit, bool>(
              builder: (context, isFavorite) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.3,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenProperty(
                                    images: images,
                                    initialIndex: 0,
                                    name: name,
                                  ),
                                ),
                              );
                            },
                            child: PageView.builder(
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  width: screenWidth,
                                  height: screenHeight * 0.3,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: screenHeight * 0.02,
                            right: screenWidth * 0.02,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<FavoriteCubit>().toggleFavorite();
                                  },
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: isFavorite ? Colors.red : Colors.white,
                                        size: screenWidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.ios_share,
                                        color: Colors.white,
                                        size: screenWidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IgnorePointer(
                            child: Container(
                              color: Colors.black.withOpacity(0.4),
                              width: screenWidth,
                              height: screenHeight * 0.3,
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.04),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.06,
                                      width: 2,
                                      color: SecondaryColor,
                                      margin: EdgeInsets.only(right: screenWidth * 0.02),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.of(context).price,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '$price ${S.of(context).EGP} ',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, size: screenWidth * 0.05, color: SecondaryColor),
                                      SizedBox(width: screenWidth * 0.01),
                                      Text(
                                        '$location - $address',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: const Color(0xff9E9E9E),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: screenWidth * 0.12,
                                      height: screenWidth * 0.12,
                                      decoration: BoxDecoration(
                                        color: KprimaryColor.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.phone_outlined,
                                          color: KprimaryColor,
                                          size: screenWidth * 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: screenWidth * 0.12,
                                      height: screenWidth * 0.12,
                                      decoration: BoxDecoration(
                                        color: Color(0xff06cd46e),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'Assets/logos_whatsapp-icon.png',
                                          width: screenWidth * 0.06,
                                          height: screenWidth * 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: KprimaryColor.withOpacity(0.1),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'Assets/icons8-bathtub-48.png',
                                      width: screenWidth * 0.06,
                                      height: screenWidth * 0.06,
                                    ),
                                    Text(
                                      '$baths ${S.of(context).Baths}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'Assets/icons8-bedroom-50.png',
                                      width: screenWidth * 0.06,
                                      height: screenWidth * 0.06,
                                    ),
                                    Text(
                                      '$beds ${S.of(context).Beds}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: screenHeight * 0.05,
                                  width: 1.5,
                                  color: KprimaryColor.withOpacity(0.1),
                                ),
                                Image.asset(
                                  'Assets/icons8-enlarge-30.png',
                                  width: screenWidth * 0.06,
                                  height: screenWidth * 0.06,
                                ),
                                Text(
                                  '$size ${S.of(context).m}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          buildAdditionalInfo(screenWidth, screenHeight,context),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            S.of(context).AboutProperty,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            description,
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: SubText,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          SuggestProperties(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
  Widget buildAdditionalInfo(double screenWidth, double screenHeight,BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
          decoration: BoxDecoration(
            color: KprimaryColor.withOpacity(0.02),
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildInfoRow(S.of(context).finishingType, finishingType, screenWidth),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildInfoRow(S.of(context).PropertyType, type, screenWidth),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
          decoration: BoxDecoration(
            color: KprimaryColor.withOpacity(0.02),
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildInfoRow(S.of(context).deliveryType, deliveryType, screenWidth),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildInfoRow(S.of(context).PaymentDetails, PaymentDetails, screenWidth),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
          decoration: BoxDecoration(
            color: KprimaryColor.withOpacity(0.02),
            borderRadius: BorderRadius.circular(8),
          ),
          child: buildInfoRow(S.of(context).ListingDate, listingDate, screenWidth),
        ),
      ],
    );
  }
}