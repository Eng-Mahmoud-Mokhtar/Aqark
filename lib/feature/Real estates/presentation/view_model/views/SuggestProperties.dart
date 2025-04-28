import 'package:flutter/material.dart';
import '../../../../../core/utiles/DetailesProperty.dart';
import '../../../../../core/utiles/constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class SuggestApartments {
  final List<String> images;
  final String name;
  final String type;
  final String location;
  final String address;
  final int baths;
  final int beds;
  final int size;
  final String price;
  final String finishingType;
  final String description;
  final String listingDate;
  final String deliveryType;
  final String PaymentDetails;

  final String ownerNumber;
  bool isFavorite;
  SuggestApartments({
    required this.images,
    required this.name,
    required this.type,
    required this.location,
    required this.address,
    required this.baths,
    required this.beds,
    required this.size,
    required this.price,
    required this.description,
    required this.finishingType,
    required this.ownerNumber,
    this.isFavorite = false,
    required this.listingDate,
    required this.deliveryType,
    required this.PaymentDetails


  });
}

List<SuggestApartments> favoriteApartments = [];

class SuggestProperties extends StatefulWidget {
  @override
  State<SuggestProperties> createState() => _SuggestPropertiesState();
}
class _SuggestPropertiesState extends State<SuggestProperties> {
  bool isFavorite = false;

  Widget _buildFeatureApartmentContainer(BuildContext context, SuggestApartments apartment) {
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
              ownerNumber: apartment.ownerNumber,
              listingDate: apartment.listingDate,
              deliveryType: apartment.deliveryType,
              PaymentDetails: apartment.PaymentDetails,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.7,
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
                    width: screenWidth * 0.9,
                    height: (screenWidth * 0.9) * 0.35,
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
                              apartment.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: apartment.isFavorite ? Colors.red : SubText,
                              size:  screenWidth * 0.1,
                            ),
                            onPressed: () {
                              setState(() {
                                apartment.isFavorite = !apartment.isFavorite;
                                if (apartment.isFavorite) {
                                  favoriteApartments.add(apartment);
                                } else {
                                  favoriteApartments.remove(apartment);
                                }
                              });
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
                  Text(
                    apartment.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: const Color(0xff2F2F2F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  _buildLocationRow(screenWidth, apartment.address, apartment.location),
                  SizedBox(height: screenWidth * 0.01),
                  _buildDetailsRow(screenWidth, apartment.baths.toString(), apartment.beds.toString(), apartment.size.toString()),
                  SizedBox(height: screenWidth * 0.01),
                  _buildPriceRow(screenWidth, apartment.price, apartment.ownerNumber),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(double screenWidth, String address, String location) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
        SizedBox(width: screenWidth * 0.01),
        Text(
          '$address , $location',
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildDetailsRow(double screenWidth, String baths, String beds, String size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildDetailItem(screenWidth, 'Assets/icons8-bathtub-48.png', baths, ' Baths'),
        SizedBox(width: screenWidth * 0.03),
        _buildDetailItem(screenWidth, 'Assets/icons8-bedroom-50.png', beds, ' Beds'),
        SizedBox(width: screenWidth * 0.03),
        _buildDetailItem(screenWidth, 'Assets/icons8-enlarge-30.png', size, ' M'),
      ],
    );
  }

  Widget _buildDetailItem(double screenWidth, String iconPath, String count, String label) {
    return Row(
      children: [
        Image.asset(iconPath, width: screenWidth * 0.04, height: screenWidth * 0.04),
        SizedBox(width: screenWidth * 0.01),
        Text(
          '$count$label',
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(double screenWidth, String price, String ownerNumber) {
    return Row(
      children: [
        Text(
          '$price EGP',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: SecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            // launch('tel:$ownerNumber');
          },
          child: Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.phone_outlined,
                size: screenWidth * 0.05,
                color: KprimaryColor,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            final formattedNumber = ownerNumber.startsWith('0')
                ? ownerNumber.replaceFirst('0', '+20')
                : '+20$ownerNumber';
            final message = 'Hello, I would like to inquire about the property.';
            final whatsappUrl = 'https://wa.me/$formattedNumber?text=${Uri.encodeComponent(message)}';
            // launch(whatsappUrl);
          },
          child: Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Color(0xff06cd46e),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AspectRatio(
                aspectRatio: 2,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('Assets/logos_whatsapp-icon.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<SuggestApartments> Apartments = [
      SuggestApartments(
          name: 'Luxury Apartment',
          type: 'Apartment',
          images: [
            'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
            'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg'
          ],
          location: 'Cairo',
          address: 'Street, 15',
          baths: 2,
          beds: 4,
          size: 180,
          price: '4,200,000',
          description: '''Experience luxury living with stunning city views and modern amenities. Explore financing options to make this your dream home!''',
          finishingType:S.of(context).SemiFinished,
          listingDate: '12/4/2025',
          ownerNumber: '01017900067',
          deliveryType: '2026',
          PaymentDetails:S.of(context).FullyPaid


      ),
      SuggestApartments(
          name: 'Cozy Apartment',
          type: 'Apartment',
          images: [
            'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
            'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg'
          ],
          location: 'Alexandria',
          address: 'Coastal Road',
          baths: 1,
          beds: 2,
          size: 90,
          price: '600,000',
          description: 'Enjoy beachfront living with affordable financing options. Perfect for relaxation and family gatherings!',
          finishingType:S.of(context).FullyFinished,
          listingDate: '1/3/2025',
          ownerNumber: '01017900067',
          deliveryType: '2027',
          PaymentDetails:S.of(context).Installments


      ),
      SuggestApartments(
          name: 'Cozy Apartment',
          type: 'Apartment',
          images: [
            'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
            'Assets/beautiful-egypt-landscape-digital-art.jpg'
          ],
          location: 'Alexandria',
          address: 'Coastal Road',
          baths: 1,
          beds: 2,
          size: 90,
          price: '600,000',
          description: 'Enjoy beachfront living with affordable financing options. Perfect for relaxation and family gatherings!',
          finishingType:S.of(context).SemiFinished,
          listingDate: '12/4/2025',
          ownerNumber: '01017900067',
          deliveryType: '2026',
          PaymentDetails:S.of(context).FullyPaid

      ),
      SuggestApartments(
          name: 'Cozy Apartment',
          type: 'Apartment',
          images: [
            'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
            'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg'
          ],
          location: 'Alexandria',
          address: 'Coastal Road',
          baths: 1,
          beds: 2,
          size: 90,
          price: '600,000',
          description: 'Enjoy beachfront living with affordable financing options. Perfect for relaxation and family gatherings!',
          finishingType:S.of(context).FullyFinished,
          listingDate: '1/3/2025',
          ownerNumber: '01017900067',
          deliveryType: '2027',
          PaymentDetails:S.of(context).Installments
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Suggested,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: screenWidth * 0.73,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Apartments.length,
              itemBuilder: (context, index) {
                final apartment = Apartments[index];
                return _buildFeatureApartmentContainer(context, apartment);
              },
              separatorBuilder: (context, index) {
                return  SizedBox(width: screenWidth * 0.02);
              },
            ),
          ),
        ),
      ],
    );
  }
}


