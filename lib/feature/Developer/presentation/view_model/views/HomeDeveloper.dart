import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/DetailesProperty.dart';
import '../../../../../generated/l10n.dart';
import 'Widget/ImageSlider.dart';
import 'Widget/ProjectObjects.dart';

class ApartmentsCubit extends Cubit<String> {
  ApartmentsCubit(BuildContext context) : super(S.of(context).all);

  void selectType(String type) => emit(type);
}
class HomeDeveloper extends StatelessWidget {
  final Project project;
  final String developerLogo;
  final String developerName;
  final String PricesStart;
  final String ResaleStart;
  final List<RealStateObjects> apartments;

  const HomeDeveloper({
    super.key,
    required this.project,
    required this.developerLogo,
    required this.developerName,
    required this.PricesStart,
    required this.ResaleStart,
    required this.apartments,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ApartmentsCubit(context)),
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: developerName,
          onBack: () => Navigator.pop(context),
          onSearch: () {},
          showSearch: false,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSlider(
                      project: project,
                      developerLogo: developerLogo,
                      developerName: developerName,
                      PricesStart: PricesStart,
                      ResaleStart: ResaleStart,
                    ),
                    _buildApartmentsSection(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildApartmentsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).AvailableProperties,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                  "52 ${S.of(context).AvailableResults}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () => _showSortBottomSheet(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screenWidth * 0.2, screenWidth * 0.1),
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.001),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      color: Colors.white,
                      size: screenWidth * 0.05,
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Text(
                      S.of(context).Sort,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          _buildTypeFilter(context, screenWidth),
          SizedBox(height: screenHeight * 0.01),
          _buildApartmentsList(context),
        ],
      ),
    );
  }
  void _showSortBottomSheet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<String> selectedSort = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              height: screenHeight * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sort,
                        color: KprimaryColor,
                        size: screenWidth * 0.05,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        S.of(context).Sort,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    thickness: 1,
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  _buildSortOption(
                    context,
                    S.of(context).MinimumPrice,
                    selectedSort.contains(S.of(context).MinimumPrice),
                        () => setState(() {
                      if (selectedSort.contains(S.of(context).MinimumPrice)) {
                        selectedSort.remove(S.of(context).MinimumPrice);
                      } else {
                        selectedSort.add(S.of(context).MinimumPrice);
                      }
                    }),
                  ),
                  _buildSortOption(
                    context,
                    S.of(context).MaximumPrice,
                    selectedSort.contains(S.of(context).MaximumPrice),
                        () => setState(() {
                      if (selectedSort.contains(S.of(context).MaximumPrice)) {
                        selectedSort.remove(S.of(context).MaximumPrice);
                      } else {
                        selectedSort.add(S.of(context).MaximumPrice);
                      }
                    }),
                  ),
                  _buildSortOption(
                    context,
                    S.of(context).Newest,
                    selectedSort.contains(S.of(context).Newest),
                        () => setState(() {
                      if (selectedSort.contains(S.of(context).Newest)) {
                        selectedSort.remove(S.of(context).Newest);
                      } else {
                        selectedSort.add(S.of(context).Newest);
                      }
                    }),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, screenWidth * 0.12),
                            backgroundColor: KprimaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: KprimaryColor,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '${S.of(context).Show} 52 ${S.of(context).Results}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, screenWidth * 0.12),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedSort.isEmpty
                                    ? KprimaryColor.withOpacity(0.3)
                                    : KprimaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedSort.clear();
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            S.of(context).Reset,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedSort.isEmpty
                                  ? KprimaryColor.withOpacity(0.3)
                                  : KprimaryColor,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
  Widget _buildSortOption(
      BuildContext context,
      String label,
      bool isSelected,
      Function() onTap,
      ) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: isSelected
              ? KprimaryColor.withOpacity(0.1)
              : KprimaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? KprimaryColor
                : KprimaryColor.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: screenWidth * 0.03,
          ),
        ),
      ),
    );
  }


  Widget _buildTypeFilter(BuildContext context, double screenWidth) {
    final apartmentTypes = [
      S.of(context).all,
      S.of(context).DeveloperSale,
      S.of(context).Resale,
    ];

    return SizedBox(
      height: screenWidth * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: apartmentTypes.length,
        itemBuilder: (context, index) {
          final type = apartmentTypes[index];
          return BlocBuilder<ApartmentsCubit, String>(
            builder: (context, selectedType) {
              return GestureDetector(
                onTap: () => context.read<ApartmentsCubit>().selectType(type),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Localizations.localeOf(context).languageCode == 'ar' ? screenWidth * 0.02 : 0,
                    right: Localizations.localeOf(context).languageCode == 'ar' ? 0 : screenWidth * 0.02,
                  ),                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenWidth * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: selectedType == type
                        ? KprimaryColor
                        : KprimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: selectedType == type ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildApartmentsList(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ApartmentsCubit, String>(
      builder: (context, selectedType) {
        final displayedApartments = apartments.isNotEmpty ? apartments : defaultApartments;
        final filteredApartments = displayedApartments.where((apartment) {
          if (selectedType == S.of(context).all) return true;
          if (selectedType == S.of(context).DeveloperSale) return apartment.isDeveloperSale;
          if (selectedType == S.of(context).Resale) return !apartment.isDeveloperSale;
          return apartment.type == selectedType;
        }).toList();
        return filteredApartments.isEmpty
            ? _buildNoResults(context)
            : GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: screenHeight * 0.01),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenWidth * 0.02,
            childAspectRatio: 0.75,
          ),
          itemCount: filteredApartments.length,
          itemBuilder: (context, index) {
            return _buildApartmentCard(context, filteredApartments[index]);
          },
        );
      },
    );
  }

  Widget _buildNoResults(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.5,
      child: Center(
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
      ),
    );
  }

  Widget _buildApartmentCard(BuildContext context, RealStateObjects apartment) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailesProperty(
                name: S.of(context).apartment,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.asset(
                      apartment.images[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
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
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        '${apartment.price} ${S.of(context).EGP}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color:Colors.white,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      S.of(context).apartment,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: const Color(0xff2F2F2F),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          "${apartment.baths} ${S.of(context).Baths}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          "${apartment.beds} ${S.of(context).Beds}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${apartment.size}${S.of(context).m}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
final List<RealStateObjects> defaultApartments = [
  RealStateObjects(
    type: "apartment",
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
    description:
    'Experience luxury living with stunning city views and modern amenities.',
    finishingType: 'Semi-Finished',
    listingDate: '12/4/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Fully Paid',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Villas',
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
    type: 'Offices',
    images: [
      'Assets/modern-office-space-with-futuristic-decor-furniture.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',    ],
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
    PaymentDetails: 'Fully Paid',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Apartments',
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
    finishingType: 'Semi-Finished',
    listingDate: '15/6/2025',
    ownerNumber: '01017900067',
    deliveryType: '2026',
    PaymentDetails: 'Installments',
    isDeveloperSale: true,
  ),
  RealStateObjects(
    type: 'Villas',
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
    PaymentDetails: 'Fully Paid',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Offices',
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
    PaymentDetails: 'Fully Paid',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Apartments',
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
    finishingType: 'Super Lux',
    listingDate: '10/10/2023',
    ownerNumber: '01012345678',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Installments over 5 years',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Apartments',
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
    finishingType: 'Semi-Finished',
    listingDate: '09/15/2023',
    ownerNumber: '01087654321',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Annual',
    isDeveloperSale: true,
  ),

  // Villas
  RealStateObjects(
    type: 'Villas',
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
    finishingType: 'Super Lux',
    listingDate: '08/20/2023',
    ownerNumber: '01011223344',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Cash or Installments',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Villas',
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
    finishingType: 'Luxury Finish',
    listingDate: '07/05/2023',
    ownerNumber: '01055667788',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Monthly',
    isDeveloperSale: true,
  ),
  RealStateObjects(
    type: 'Apartments',
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
    finishingType: 'Super Lux',
    listingDate: '04/30/2023',
    ownerNumber: '01022334455',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Installments over 7 years',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Villas',
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
    finishingType: 'Luxury Finish',
    listingDate: '03/15/2023',
    ownerNumber: '01066778899',
    deliveryType: 'Ready to move',
    PaymentDetails: 'Cash or Installments',
    isDeveloperSale: false,
  ),
  RealStateObjects(
    type: 'Offices',
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
    finishingType: 'Lux Finish',
    listingDate: '02/10/2023',
    ownerNumber: '01044556677',
    deliveryType: 'Ready for use',
    PaymentDetails: 'Cash',
    isDeveloperSale: false,
  ),
];

class RealStateObjects {
  final List<String> images;
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
  final bool isDeveloperSale;
  bool isFavorite;

  RealStateObjects({
    required this.images,
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
    required this.isDeveloperSale,
    this.isFavorite = false,
  });
}
