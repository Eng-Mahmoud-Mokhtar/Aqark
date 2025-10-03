import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/Widgets/buildFilters.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/Widgets/DetailesProperty.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/Widget/BottomHome.dart';

// Cubit for managing filter and sort state
class ExploreCubit extends Cubit<Map<String, dynamic>> {
  ExploreCubit(BuildContext context)
      : super({
    'category': '',
    'value': '',
    'sort': '',
    'price_range': {'min': 0.0, 'max': 15000000.0}
  });

  void selectFilter(String category, dynamic value) =>
      emit({...state, 'category': category, 'value': value});

  void selectPriceRange(double min, double max) => emit({
    ...state,
    'category': 'price_range',
    'value': {'min': min, 'max': max},
  });

  void clearFilter() => emit({
    ...state,
    'category': '',
    'value': '',
    'price_range': {'min': 0.0, 'max': 15000000.0}
  });

  void selectSort(String sort) => emit({...state, 'sort': sort});
}

// Real estate object model
class RealStateObjects {
  final List<String> images;
  final String type;
  final String compoundName;
  final String location;
  final String address;
  final int baths;
  final int beds;
  final int size; // For properties mode
  final int minSize; // For compounds mode
  final int maxSize; // For compounds mode
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
    required this.type,
    required this.compoundName,
    required this.location,
    required this.address,
    required this.baths,
    required this.beds,
    required this.size,
    required this.minSize,
    required this.maxSize,
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

// Default apartments data (for Properties mode)
final List<RealStateObjects> defaultApartments = [
  RealStateObjects(
    type: 'Apartment',
    compoundName: 'City View',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'New Cairo',
    address: '90th Street',
    baths: 2,
    beds: 3,
    size: 150,
    minSize: 0,
    maxSize: 0,
    price: '2500000',
    description:
    'A luxury apartment in a prime location with a stunning city view.',
    finishingType: 'Fully Finished',
    listingDate: '2023-10-10',
    ownerNumber: '01012345678',
    deliveryType: '2024',
    PaymentDetails: 'Installment over 5 Years',
    isForRent: false,
  ),
  RealStateObjects(
    type: 'Villa',
    compoundName: 'Green Hills',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'Sheikh Zayed',
    address: 'Villa 10',
    baths: 4,
    beds: 5,
    size: 300,
    minSize: 0,
    maxSize: 0,
    price: '8000000',
    description:
    'A spacious villa with a private garden and pool in a quiet area.',
    finishingType: 'Semi Finished',
    listingDate: '2023-08-20',
    ownerNumber: '01011223344',
    deliveryType: '2025',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    type: 'Office',
    compoundName: 'Downtown Hub',
    images: [
      'Assets/photorealistic-environment-lawyer.jpg',
      'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
    ],
    location: 'Nasr City',
    address: 'El-Nahas Street',
    baths: 1,
    beds: 0,
    size: 80,
    minSize: 0,
    maxSize: 0,
    price: '8000',
    description:
    'A modern office for rent in a prime location near public transportation.',
    finishingType: 'Fully Finished',
    listingDate: '2023-05-25',
    ownerNumber: '01033445566',
    deliveryType: '2023',
    PaymentDetails: 'Monthly Rent',
    isForRent: true,
  ),
];

// Default compounds data (for Compounds mode)
final List<RealStateObjects> defaultCompounds = [
  RealStateObjects(
    type: 'Apartment',
    compoundName: 'Palm Hills',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: '6th of October',
    address: 'Building 5',
    baths: 2,
    beds: 3,
    size: 0,
    minSize: 120,
    maxSize: 180,
    price: '3500000',
    description:
    'Modern apartments in a prestigious compound with top amenities.',
    finishingType: 'Semi Finished',
    listingDate: '2025-05-01',
    ownerNumber: '01098765432',
    deliveryType: '2027',
    PaymentDetails: 'Installment over 7 Years',
    isForRent: false,
  ),
  RealStateObjects(
    type: 'Villa',
    compoundName: 'Madinaty',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'New Cairo',
    address: 'Villa 25',
    baths: 4,
    beds: 5,
    size: 0,
    minSize: 250,
    maxSize: 350,
    price: '9500000',
    description:
    'Luxurious villa with private pool and garden in a gated community.',
    finishingType: 'Fully Finished',
    listingDate: '2025-04-15',
    ownerNumber: '01087654321',
    deliveryType: '2028',
    PaymentDetails: 'Cash',
    isForRent: false,
  ),
  RealStateObjects(
    type: 'Apartment',
    compoundName: 'Sodic East',
    images: [
      'Assets/movie-night-by-pool-whole-family.jpg',
      'Assets/house-isolated-field.jpg',
    ],
    location: 'New Heliopolis',
    address: 'Tower 3',
    baths: 1,
    beds: 2,
    size: 0,
    minSize: 80,
    maxSize: 120,
    price: '2000000',
    description: 'Cozy apartment with modern design in a vibrant compound.',
    finishingType: 'Fully Finished',
    listingDate: '2025-06-10',
    ownerNumber: '01076543210',
    deliveryType: '2026',
    PaymentDetails: 'Installment over 5 Years',
    isForRent: false,
  ),
  RealStateObjects(
    type: 'Villa',
    compoundName: 'Hyde Park',
    images: [
      'Assets/30d6e5a3-9774-4ba7-a03f-3c2f32b99d24.jpeg',
      'Assets/2f16b3f2-2b9b-4231-8768-5e09cb827110.jpeg',
    ],
    location: 'New Cairo',
    address: 'Villa 15',
    baths: 3,
    beds: 4,
    size: 0,
    minSize: 200,
    maxSize: 280,
    price: '7000000',
    description:
    'Elegant villa with spacious interiors in a serene compound.',
    finishingType: 'Semi Finished',
    listingDate: '2025-03-20',
    ownerNumber: '01065432109',
    deliveryType: '2027',
    PaymentDetails: 'Installment over 6 Years',
    isForRent: false,
  ),
];

// Widget to build price row for Properties mode
Widget buildPriceRow(
    double screenWidth, String price, String ownerNumber, BuildContext context) {
  final formatter = NumberFormat('#,###');
  return Row(
    children: [
      Text(
        '${formatter.format(int.parse(price))} ${S.of(context).EGP}',
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

// Widget to build location row
Widget buildLocationRow(
    double screenWidth, String address, String location, BuildContext context) {
  return Row(
    children: [
      Icon(Icons.location_on_outlined,
          size: screenWidth * 0.04, color: SecondaryColor),
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
          textDirection: Directionality.of(context),
        ),
      ),
    ],
  );
}

// Widget to build details row
Widget buildDetailsRow(BuildContext context, double screenWidth, String baths,
    String beds, String size) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
      size + S.of(context).m,
      style: TextStyle(
        fontSize: screenWidth * 0.03,
        color: const Color(0xff9E9E9E),
        fontWeight: FontWeight.w400,
      ),
    ),
  ]);
}

// Widget to build apartment item
Widget buildApartmentItem(
    BuildContext context, RealStateObjects apartment, bool isCompoundsMode) {
  final screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailesProperty(
            name: '${apartment.type}, ${apartment.compoundName}',
            type: apartment.type,
            images: apartment.images,
            location: apartment.location,
            address: apartment.address,
            baths: apartment.baths,
            beds: apartment.beds,
            size: isCompoundsMode ? apartment.minSize : apartment.size,
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
                  width: screenWidth * 0.08,
                  height: screenWidth *  0.08,
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
                            color: apartment.isFavorite ? Colors.red : SubText,
                            size: screenWidth * 0.08,
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
                        '${apartment.type}, ${apartment.compoundName}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: const Color(0xff2F2F2F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isCompoundsMode)
                      Container(
                        width: screenWidth * 0.08,
                        height: screenWidth * 0.08,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border:
                          Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/image 7.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                // Layout for compounds mode: details -> price label -> price -> buttons
                // Layout for properties mode: location -> details -> price/buttons
                if (!isCompoundsMode) ...[
                  buildLocationRow(
                      screenWidth, apartment.address, apartment.location, context),
                  SizedBox(height: screenWidth * 0.01),
                  buildDetailsRow(
                    context,
                    screenWidth,
                    apartment.baths.toString(),
                    apartment.beds.toString(),
                    apartment.size.toString(),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildPriceRow(
                      screenWidth, apartment.price, apartment.ownerNumber, context),
                ] else ...[
                  buildDetailsRow(
                    context,
                    screenWidth,
                    apartment.baths.toString(),
                    apartment.beds.toString(),
                    '${apartment.minSize}~${apartment.maxSize}',
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    S.of(context).starting_from,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${NumberFormat('#,###').format(int.parse(apartment.price))} ${S.of(context).EGP}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: SecondaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize:
                            Size(double.infinity, screenWidth * 0.12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: KprimaryColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Handle phone call logic here
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: screenWidth * 0.05,
                                color: KprimaryColor,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                S.of(context).CallUs,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff06cd46e),
                            minimumSize:
                            Size(double.infinity, screenWidth * 0.12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Handle WhatsApp logic here
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'Assets/logos_whatsapp-icon.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.05,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                S.of(context).WhatsApp,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Main ExplorePage widget
class ExplorePage extends StatefulWidget {
  final List<RealStateObjects> apartments;

  const ExplorePage({super.key, required this.apartments});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool isCompoundsMode = true;

  void toggleMode() {
    setState(() {
      isCompoundsMode = !isCompoundsMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_) => ExploreCubit(context),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: isCompoundsMode
              ? S.of(context).CompoundsEgypt
              : S.of(context).Properties,
          onBack: () {
            context.read<BottomNavCubit>().setIndex(0);
          },
          showSearch: true,
          onPressed: (){FilterRealestate(context);},

        ),
        floatingActionButton: SizedBox(
          width: screenWidth * 0.4,
          height: screenWidth * 0.12,
          child: FloatingActionButton.extended(
            onPressed: toggleMode,
            backgroundColor: KprimaryColor,
            label: Text(
              isCompoundsMode
                  ? S.of(context).Properties
                  : S.of(context).Compounds,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            icon: Icon(
              Icons.swap_horiz,
              color: Colors.white,
              size: screenWidth * 0.05,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: BlocBuilder<ExploreCubit, Map<String, dynamic>>(
                  builder: (context, state) {
                    final displayedList = isCompoundsMode
                        ? (widget.apartments.isNotEmpty
                        ? widget.apartments
                        : defaultCompounds)
                        : (widget.apartments.isNotEmpty
                        ? widget.apartments
                        : defaultApartments);

                    final filteredList = displayedList.where(
                          (apartment) {
                        final category = state['category']!;
                        final value = state['value'];
                        if (category.isEmpty || value == '') return true;

                        if (category == 'Property Type') {
                          return apartment.type == value;
                        } else if (category == 'rooms') {
                          final roomsValue = value as Map<String, String>;
                          bool bedsMatch = true;
                          bool bathsMatch = true;
                          if (roomsValue.containsKey('beds')) {
                            final beds = roomsValue['beds']!;
                            if (beds == '4+') {
                              bedsMatch = apartment.beds >= 4;
                            } else {
                              bedsMatch = apartment.beds == int.tryParse(beds);
                            }
                          }
                          if (roomsValue.containsKey('baths')) {
                            final baths = roomsValue['baths']!;
                            if (baths == '3+') {
                              bathsMatch = apartment.baths >= 3;
                            } else {
                              bathsMatch = apartment.baths == int.tryParse(baths);
                            }
                          }
                          return bedsMatch && bathsMatch;
                        } else if (category == 'price_range') {
                          final price = int.tryParse(apartment.price) ?? 0;
                          final minPrice = state['value']['min'] as double;
                          final maxPrice = state['value']['max'] as double;
                          return price >= minPrice && price <= maxPrice;
                        } else if (category == 'finishing') {
                          return apartment.finishingType == value;
                        } else if (category == 'delivery') {
                          if (value == '2030+') {
                            return int.parse(apartment.deliveryType) >= 2030;
                          }
                          return apartment.deliveryType == value;
                        }
                        return true;
                      },
                    ).toList();

                    // Apply sorting
                    if (state['sort'] == 'PriceLowToHigh') {
                      filteredList.sort(
                              (a, b) => int.parse(a.price).compareTo(int.parse(b.price)));
                    } else if (state['sort'] == 'PriceHighToLow') {
                      filteredList.sort(
                              (a, b) => int.parse(b.price).compareTo(int.parse(b.price)));
                    } else if (state['sort'] == 'NewestFirst') {
                      filteredList.sort((a, b) => DateTime.parse(b.listingDate)
                          .compareTo(DateTime.parse(a.listingDate)));
                    } else if (state['sort'] == 'OldestFirst') {
                      filteredList.sort((a, b) => DateTime.parse(a.listingDate)
                          .compareTo(DateTime.parse(b.listingDate)));
                    }
                    return filteredList.isEmpty
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
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final apartment = filteredList[index];
                        return Padding(
                          padding:
                          EdgeInsets.only(bottom: screenHeight * 0.02),
                          child: buildApartmentItem(
                              context, apartment, isCompoundsMode),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}