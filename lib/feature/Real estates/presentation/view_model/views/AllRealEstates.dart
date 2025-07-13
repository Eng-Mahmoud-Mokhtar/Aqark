import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/Widgets/DetailesProperty.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/Widgets/buildFilters.dart';

class AllApartments extends StatelessWidget {
  final List<RealStateObjects> apartments;

  const AllApartments({super.key, required this.apartments});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Properties,
        onBack: () => Navigator.pop(context),
        onPressed: (){FilterRealestate(context);},
        showSearch: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
        child: Column(
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  final displayedApartments =
                  apartments.isNotEmpty ? apartments : defaultApartments;

                  return displayedApartments.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'Assets/file.png',
                          width: screenWidth * 0.3,
                          color: KprimaryColor.withOpacity(0.08),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          S.of(context).no_results,
                          style: TextStyle(
                            color: const Color(0xff2F2F2F),
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    itemCount: displayedApartments.length,
                    itemBuilder: (context, index) {
                      final apartment = displayedApartments[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: buildApartmentItem(context, apartment),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RealStateObjects {
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
  final String ownerNumber;
  final String deliveryType;
  final String PaymentDetails;
  final bool isForRent;
  bool isFavorite;

  RealStateObjects({
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
    required this.listingDate,
    required this.ownerNumber,
    required this.deliveryType,
    required this.PaymentDetails,
    required this.isForRent,
    this.isFavorite = false,
  });
}

final List<RealStateObjects> defaultApartments = [
  RealStateObjects(
    name: 'Luxury Apartment',
    type: 'Apartment',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'Cairo',
    address: 'Street, 15',
    baths: 2,
    beds: 4,
    size: 180,
    price: '4,200,000',
    description: 'Experience luxury living with stunning city views and modern amenities.',
    finishingType: 'Unfinished',
    listingDate: '12/4/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Cozy Villa',
    type: 'Villa',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'Alexandria',
    address: 'Coastal Road',
    baths: 3,
    beds: 5,
    size: 250,
    price: '8,000,000',
    description: 'A beautiful villa with a private pool and garden.',
    finishingType: 'Fully Finished',
    listingDate: '1/3/2025',
    ownerNumber: '01017900067',
    deliveryType: '2027',
    PaymentDetails: 'Installments',
    isForRent: true,
  ),
  RealStateObjects(
    name: 'Modern Office',
    type: 'Office',
    images: [
      'Assets/modern-office-space-with-futuristic-decor-furniture.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
    ],
    location: 'Giza',
    address: 'Business Park',
    baths: 1,
    beds: 0,
    size: 120,
    price: '2,500,000',
    description: 'A modern office space with great facilities.',
    finishingType: 'Fully Finished',
    listingDate: '10/5/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Installment over 10 Years',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Studio Apartment',
    type: 'Apartment',
    images: [
      'Assets/shot-panoramic-composition-bedroom.jpg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'Cairo',
    address: 'Downtown',
    baths: 1,
    beds: 1,
    size: 80,
    price: '1,800,000',
    description: 'A cozy studio apartment in the heart of the city.',
    finishingType: 'Semi Finished',
    listingDate: '15/6/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Installment over 2 Years',
    isForRent: true,
  ),
  RealStateObjects(
    name: 'Luxury Villa',
    type: 'Villa',
    images: [
      'Assets/house-isolated-field.jpg',
      'Assets/movie-night-by-pool-whole-family.jpg',
    ],
    location: 'Sharm El Sheikh',
    address: 'Sea View Road',
    baths: 4,
    beds: 6,
    size: 300,
    price: '12,000,000',
    description: 'A luxurious villa with a stunning sea view.',
    finishingType: 'Fully Finished',
    listingDate: '20/7/2025',
    ownerNumber: '01017900067',
    deliveryType: '2027',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Commercial Office',
    type: 'Office',
    images: [
      'Assets/room-used-official-event.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
    ],
    location: 'New Cairo',
    address: 'Business District',
    baths: 2,
    beds: 0,
    size: 150,
    price: '3,000,000',
    description: 'A commercial office space in a prime location.',
    finishingType: 'Fully Finished',
    listingDate: '25/8/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Luxury Apartment in New Cairo',
    type: 'Apartment',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'New Cairo',
    address: '90th Street, Tower 12',
    baths: 2,
    beds: 3,
    size: 150,
    price: '2,500,000',
    description: 'A luxury apartment in a prime location with a stunning city view.',
    finishingType: 'Fully Finished',
    listingDate: '10/10/2023',
    ownerNumber: '01012345678',
    deliveryType: '2040',
    PaymentDetails: 'Installment over 10 Years',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Apartment for Rent in Maadi',
    type: 'Apartment',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'Maadi',
    address: '9th Street, Building 25',
    baths: 1,
    beds: 2,
    size: 100,
    price: '5,000',
    description: 'A modern apartment for rent in a quiet area close to all amenities.',
    finishingType: 'Semi Finished',
    listingDate: '09/15/2023',
    ownerNumber: '01087654321',
    deliveryType: '2025',
    PaymentDetails: 'Installment over 10 Years',
    isForRent: true,
  ),
  RealStateObjects(
    name: 'Villa for Sale in Sheikh Zayed',
    type: 'Villa',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'Sheikh Zayed',
    address: 'Al Yasmeen Compound, Villa 12',
    baths: 4,
    beds: 5,
    size: 300,
    price: '8,000,000',
    description: 'A luxury villa with a private garden and swimming pool in an upscale compound.',
    finishingType: 'Semi Finished',
    listingDate: '08/20/2023',
    ownerNumber: '01011223344',
    deliveryType: '2028',
    PaymentDetails: 'Installment over 2 Years',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Villa for Rent in North Coast',
    type: 'Villa',
    images: [
      'Assets/house-isolated-field.jpg',
      'Assets/movie-night-by-pool-whole-family.jpg',
    ],
    location: 'North Coast',
    address: 'Marina Compound, Villa 7',
    baths: 3,
    beds: 4,
    size: 250,
    price: '20,000',
    description: 'A stylish seasonal rental villa with a sea view.',
    finishingType: 'Semi Finished',
    listingDate: '07/05/2023',
    ownerNumber: '01055667788',
    deliveryType: '2030',
    PaymentDetails: 'Installment over 6 Years',
    isForRent: true,
  ),
  RealStateObjects(
    name: 'Office for Sale in Fifth Settlement',
    type: 'Office',
    images: [
      'Assets/photorealistic-environment-lawyer.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
    ],
    location: 'Fifth Settlement',
    address: 'Business Tower, 10th Floor',
    baths: 2,
    beds: 0,
    size: 120,
    price: '3,500,000',
    description: 'A luxurious office in a strategic location near all services.',
    finishingType: 'Semi Finished',
    listingDate: '06/12/2023',
    ownerNumber: '01099887766',
    deliveryType: '2025',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Office for Rent in Nasr City',
    type: 'Office',
    images: [
      'Assets/photorealistic-environment-lawyer.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
    ],
    location: 'Nasr City',
    address: 'Mostafa El-Nahas Street, Building 15',
    baths: 1,
    beds: 0,
    size: 80,
    price: '8,000',
    description: 'A modern office for rent in a prime location near public transportation.',
    finishingType: 'Semi Finished',
    listingDate: '05/25/2023',
    ownerNumber: '01033445566',
    deliveryType: '2025',
    PaymentDetails: 'Installment over 10 Years',
    isForRent: true,
  ),
  RealStateObjects(
    name: 'Duplex Apartment in Al Rehab',
    type: 'Apartment',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'Al Rehab',
    address: 'Al Rehab Compound, Building 8',
    baths: 3,
    beds: 4,
    size: 200,
    price: '4,000,000',
    description: 'A luxurious duplex apartment with a garden view.',
    finishingType: 'Semi Finished',
    listingDate: '04/30/2023',
    ownerNumber: '01022334455',
    deliveryType: '2023',
    PaymentDetails: 'Installment over 5 Years',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Luxury Villa in Hurghada',
    type: 'Villa',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'Hurghada',
    address: 'Red Sea Compound, Villa 3',
    baths: 5,
    beds: 6,
    size: 400,
    price: '12,000,000',
    description: 'A luxury villa with a direct sea view and a private pool.',
    finishingType: 'Semi Finished',
    listingDate: '03/15/2023',
    ownerNumber: '01066778899',
    deliveryType: '2025',
    PaymentDetails: 'Installment over 2 Years',
    isForRent: false,
  ),
  RealStateObjects(
    name: 'Office in Cairo Tower',
    type: 'Office',
    images: [
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
      'Assets/photorealistic-environment-lawyer.jpg',
    ],
    location: 'Downtown',
    address: 'Cairo Tower, 20th Floor',
    baths: 2,
    beds: 0,
    size: 150,
    price: '5,000,000',
    description: 'A luxurious office in Cairo Tower with a panoramic city view.',
    finishingType: 'Semi Finished',
    listingDate: '02/10/2023',
    ownerNumber: '01044556677',
    deliveryType: '2025',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
];

Widget buildPriceRow(double screenWidth, String price, String ownerNumber, BuildContext context) {
  return Row(
    children: [
      Text(
        '${price} ${S.of(context).EGP}',
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          color: SecondaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          // Handle phone call logic here
        },
        child: Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
            color: KprimaryColor.withOpacity(0.1),
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
          // Handle WhatsApp logic here
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

Widget buildLocationRow(double screenWidth, String address, String location) {
  return Row(
    children: [
      Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
      SizedBox(width: screenWidth * 0.01),
      Expanded(
        child: Text(
          '$address , $location',
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget buildDetailsRow(BuildContext context, double screenWidth, String baths, String beds, String size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01,
          vertical: screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: KprimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Image.asset(
              'Assets/icons8-bathtub-48.png',
              width: screenWidth * 0.05,
              height: screenWidth * 0.05,
            ),
            SizedBox(width: screenWidth * 0.01),
            Text(
              baths,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: screenWidth * 0.02),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01,
          vertical: screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: KprimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Image.asset(
              'Assets/icons8-bedroom-50.png',
              width: screenWidth * 0.05,
              height: screenWidth * 0.05,
            ),
            SizedBox(width: screenWidth * 0.01),
            Text(
              beds,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: screenWidth * 0.02),
      Text(
        '|',
        style: TextStyle(
          fontSize: screenWidth * 0.06,
          fontWeight: FontWeight.w300,
          color: Colors.grey.shade400,
        ),
      ),
      SizedBox(width: screenWidth * 0.02),
      Image.asset(
        'Assets/icons8-enlarge-30.png',
        width: screenWidth * 0.04,
        height: screenWidth * 0.04,
      ),
      SizedBox(width: screenWidth * 0.01),
      Text(
        '$size${S.of(context).m}',
        style: TextStyle(
          fontSize: screenWidth * 0.03,
          color: const Color(0xff9E9E9E),
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

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
                            apartment.isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: apartment.isFavorite ? Colors.red : SubText,
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
                Text(
                  apartment.name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: const Color(0xff2F2F2F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                buildLocationRow(screenWidth, apartment.address, apartment.location),
                SizedBox(height: screenWidth * 0.01),
                buildDetailsRow(
                    context, screenWidth, apartment.baths.toString(), apartment.beds.toString(), apartment.size.toString()),
                SizedBox(height: screenWidth * 0.01),
                buildPriceRow(screenWidth, apartment.price, apartment.ownerNumber, context),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}