import 'package:bk/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/Widgets/DetailesProperty.dart';
import '../../../../../core/Widgets/buildFilters.dart';
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
          onPressed: (){FilterDevelopers(context);},
          showSearch: true,
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
      child: Column(
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
      constraints: BoxConstraints(
        maxWidth: screenWidth,
        maxHeight: screenHeight * 0.9,
      ),
      builder: (context) {
        final isRtl = Localizations.localeOf(context).languageCode == 'ar';
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: FractionallySizedBox(
            heightFactor: 0.7,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
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
                              onPressed: () => Navigator.pop(context),
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
                                setState(() => selectedSort.clear());
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
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenWidth * 0.12,
        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: isSelected
              ? KprimaryColor.withOpacity(0.1)
              : KprimaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? KprimaryColor : KprimaryColor.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Text(
          label,
          textAlign: isRtl ? TextAlign.right : TextAlign.left,
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
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenWidth * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: selectedType == type ? KprimaryColor : KprimaryColor.withOpacity(0.1),
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
          return false;
        }).toList();
        return filteredApartments.isEmpty
            ? _buildNoResults(context)
            : GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: screenHeight * 0.01),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              builder: (context) => SubscriptionPage(
                broker: Broker(
                  name: 'Default Broker',
                  phone: '01012345678',
                  location: 'Cairo',
                  city: 'Cairo',
                  details: 'Experienced real estate broker',
                  image: 'Assets/broker_image.png',
                  isFeatured: false,
                ),
                apartment: apartment,
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
                      width: screenWidth * 0.08,
                      height: screenWidth * 0.08,
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
                              onPressed: () {},
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
                          fontSize: screenWidth * 0.03,
                          color: SecondaryColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            ),
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
    type: 'Office',
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
    PaymentDetails: 'Installment over 10 Years',
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: true,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
    isDeveloperSale: false,
  ),
  RealStateObjects(
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
class Broker {
  final String name;
  final String phone;
  final String location;
  final String city;
  final String details;
  final String image;
  final bool isFeatured;

  Broker({
    required this.name,
    required this.phone,
    required this.location,
    required this.city,
    required this.details,
    required this.image,
    required this.isFeatured,
  });
}
class SubscriptionPage extends StatelessWidget {
  final Broker broker;
  final RealStateObjects apartment;

  const SubscriptionPage({Key? key, required this.broker, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: "Subscription",
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image.asset(
                    'Assets/freepik__logo-design-for-a-real-estate-app-featuring-the-le__89841.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                "Choose Your Plan",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title: "Monthly Subscription",
                price: "\$19.99 / month",
                description:
                "Ideal for short-term needs. Get instant access to premium listings, verified brokers, and top property opportunities — with the flexibility to cancel anytime.",
                onSubscribe: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (_) => PaymentPage(
                    broker: broker,
                    selectedPlan: "Monthly Subscription - \$19.99 / month",
                    apartment: apartment,
                  ),
                  ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title: "Yearly Subscription",
                price: "\$199.99 / year",
                description:
                "Best value! Save over 15% by subscribing yearly. Enjoy uninterrupted access to all premium features, early listings, and exclusive broker deals for a full year.",
                isPopular: true,
                onSubscribe: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentPage(
                        broker: broker,
                        selectedPlan: "Yearly Subscription - \$199.99 / year",
                        apartment: apartment,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(
      BuildContext context, {
        required String title,
        required String price,
        required String description,
        bool isPopular = false,
        required VoidCallback onSubscribe,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: screenWidth * 0.01),
          padding: EdgeInsets.all(screenWidth * 0.04),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE0E0E0), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenWidth * 0.02),
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                price,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: SecondaryColor,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: SubText,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenWidth * 0.02),
              ElevatedButton(
                onPressed: onSubscribe,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Subscribe Now",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        if (isPopular)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.025,
                vertical: screenWidth * 0.012,
              ),
              decoration: BoxDecoration(
                color: SecondaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Text(
                "Most Popular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
class PaymentPage extends StatefulWidget {
  final Broker broker;
  final String selectedPlan;
  final RealStateObjects apartment;

  const PaymentPage({Key? key, required this.broker, required this.selectedPlan, required this.apartment}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {
  String? selectedMethod;
  bool showCreditCardDetails = false;
  bool showPaypalDetails = false;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "label": "Credit Card",
      "image": "Assets/Mastercard.png",
    },
    {
      "label": "PayPal",
      "image": "Assets/PayPal.png",
    },
  ];

  final Map<String, FocusNode> _focusNodes = {
    "Card Number": FocusNode(),
    "Cardholder Name": FocusNode(),
    "Expiry Date": FocusNode(),
    "CVV": FocusNode(),
    "PayPal Email": FocusNode(),
    "PayPal Password": FocusNode(),
  };

  @override
  void dispose() {
    _focusNodes.values.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: "Payment method",
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image.asset(
                    'Assets/freepik__logo-design-for-a-real-estate-app-featuring-the-le__89841.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                "Choose Payment Method",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Column(
                children: paymentMethods.map((method) {
                  final isSelected = method["label"] == selectedMethod;
                  final isCreditCard = method["label"] == "Credit Card";
                  final isPaypal = method["label"] == "PayPal";
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedMethod = null;
                          showCreditCardDetails = false;
                          showPaypalDetails = false;
                        } else {
                          selectedMethod = method["label"];
                          showCreditCardDetails = isCreditCard;
                          showPaypalDetails = isPaypal;
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? KprimaryColor
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                method["image"]!,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                              ),
                              SizedBox(width: screenWidth * 0.04),
                              Expanded(
                                child: Text(
                                  method["label"]!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                isSelected
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_right,
                                size: screenWidth * 0.05,
                                color: isSelected
                                    ? KprimaryColor
                                    : Colors.grey,
                              ),
                            ],
                          ),
                          if (isCreditCard && showCreditCardDetails) ...[
                            SizedBox(height: screenWidth * 0.04),
                            Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                            SizedBox(height: screenWidth * 0.03),
                            _creditCardForm(screenWidth),
                          ],
                          if (isPaypal && showPaypalDetails) ...[
                            SizedBox(height: screenWidth * 0.04),
                            Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                            SizedBox(height: screenWidth * 0.03),
                            _paypalForm(screenWidth),
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: screenWidth * 0.04),
              Center(
                child: ElevatedButton(
                  onPressed: selectedMethod == null
                      ? null
                      : () {
                    _showProcessingDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, screenWidth * 0.12),
                    backgroundColor:
                    selectedMethod == null ? SubText : KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget _creditCardForm(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField("Card Number", screenWidth),
        SizedBox(height: screenWidth * 0.02),
        _buildTextField("Cardholder Name", screenWidth),
        SizedBox(height: screenWidth * 0.02),
        Row(
          children: [
            Expanded(child: _buildTextField("Expiry Date", screenWidth)),
            SizedBox(width: screenWidth * 0.02),
            Expanded(child: _buildTextField("CVV", screenWidth)),
          ],
        ),
      ],
    );
  }

  Widget _paypalForm(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField("PayPal Email", screenWidth, keyboardType: TextInputType.emailAddress),
        SizedBox(height: screenWidth * 0.02),
        _buildTextField("PayPal Password", screenWidth, obscureText: true),
      ],
    );
  }

  Widget _buildTextField(String label, double screenWidth, {TextInputType? keyboardType, bool obscureText = false}) {
    return Focus(
      focusNode: _focusNodes[label],
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return TextField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: isFocused ? KprimaryColor : Colors.grey,
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenWidth * 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: KprimaryColor, width: 1.5),
              ),
            ),
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: keyboardType ?? (label == "CVV" || label == "Card Number"
                ? TextInputType.number
                : TextInputType.text),
            obscureText: obscureText || label == "CVV",
          );
        },
      ),
    );
  }

  void _showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ProcessingPaymentDialog(broker: widget.broker, apartment: widget.apartment);
      },
    );
  }
}
class ProcessingPaymentDialog extends StatefulWidget {
  final Broker broker;
  final RealStateObjects apartment;

  const ProcessingPaymentDialog({Key? key, required this.broker, required this.apartment}) : super(key: key);

  @override
  State<ProcessingPaymentDialog> createState() => _ProcessingPaymentDialogState();
}
class _ProcessingPaymentDialogState extends State<ProcessingPaymentDialog> {
  bool isProcessing = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(screenWidth * 0.04),
      content: SizedBox(
        width: screenWidth,
        height: screenWidth * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcessing) ...[
              Text(
                "Payment Processing",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
              SizedBox(height: screenWidth * 0.2),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0c356b)),
              ),
              SizedBox(height: screenWidth * 0.2),
              Text(
                "Please wait while we process money from your bank account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey.shade600),
              ),
            ] else ...[
              Icon(
                Icons.check_circle,
                color: KprimaryColor,
                size: screenWidth * 0.15,
              ),
              const SizedBox(height: 20),
              Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c356b),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                "Your subscription has been placed.\nWe’ll send you an email with your subscription details.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey.shade600),
              ),
              SizedBox(height: screenWidth * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailesProperty(
                        name: S.of(context).apartment,
                        type: widget.apartment.type,
                        images: widget.apartment.images,
                        location: widget.apartment.location,
                        address: widget.apartment.address,
                        baths: widget.apartment.baths,
                        beds: widget.apartment.beds,
                        size: widget.apartment.size,
                        price: widget.apartment.price,
                        description: widget.apartment.description,
                        finishingType: widget.apartment.finishingType,
                        listingDate: widget.apartment.listingDate,
                        ownerNumber: widget.apartment.ownerNumber,
                        deliveryType: widget.apartment.deliveryType,
                        PaymentDetails: widget.apartment.PaymentDetails,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
