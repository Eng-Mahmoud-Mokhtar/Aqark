import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class InteriorDesignCompany {
  final String name;
  final String description;
  final String address;
  final String image;
  final double rating;
  final int reviewCount;
  final String category;
  final bool isFeatured;
  final List<String> services;
  final List<String> features;
  final List<Map<String, String>> process;
  final List<String> portfolio;

  InteriorDesignCompany({
    required this.name,
    required this.description,
    required this.address,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.isFeatured,
    required this.services,
    required this.features,
    required this.process,
    required this.portfolio,
  });

  Map<String, dynamic> toDetailsMap() => {
        'services': services,
        'features': features,
        'process': process,
        'portfolio': portfolio,
        'image': image,
      };
}

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit() : super(false);

  void toggleFavorite() => emit(!state);
}

class InteriorDesignCompanies extends StatefulWidget {
  const InteriorDesignCompanies({Key? key}) : super(key: key);

  @override
  _InteriorDesignCompaniesState createState() =>
      _InteriorDesignCompaniesState();
}

class _InteriorDesignCompaniesState extends State<InteriorDesignCompanies> {
  String searchQuery = '';
  String? _selectedGovernorate;
  String? _selectedCity;
  String _selectedFilter = 'none';

  final List<InteriorDesignCompany> companies = [
    InteriorDesignCompany(
      name: 'Elegant Designs',
      description: 'Premium modern interior design solutions',
      address: 'Nasr City, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.8,
      reviewCount: 56,
      category: 'Modern',
      isFeatured: true,
      services: [
        'Residential Design',
        'Commercial Design',
        '3D Visualization',
        'Furniture Selection',
      ],
      features: [
        'Sleek Aesthetics',
        'Smart Space Planning',
        'Bold Color Schemes',
        'Custom Lighting',
      ],
      process: [
        {
          'step': '1',
          'title': 'Consultation',
          'desc': 'Understand client needs'
        },
        {'step': '2', 'title': 'Design', 'desc': 'Create initial concepts'},
        {'step': '3', 'title': 'Execution', 'desc': 'Implement the design'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    InteriorDesignCompany(
      name: 'Classic Interiors',
      description: 'Timeless and elegant classic designs',
      address: 'Zamalek, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.7,
      reviewCount: 42,
      category: 'Classic',
      isFeatured: true,
      services: [
        'Luxury Home Design',
        'Antique Integration',
        'Custom Woodwork',
        'Interior Renovation',
      ],
      features: [
        'Ornate Details',
        'Rich Textures',
        'Warm Lighting',
        'Heritage Elements',
      ],
      process: [
        {
          'step': '1',
          'title': 'Discovery',
          'desc': 'Explore client preferences'
        },
        {'step': '2', 'title': 'Planning', 'desc': 'Develop detailed plans'},
        {
          'step': '3',
          'title': 'Installation',
          'desc': 'Execute with precision'
        },
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    InteriorDesignCompany(
      name: 'Minimalist Homes',
      description: 'Clean and simple minimalist designs',
      address: '6th October City, Giza',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.5,
      reviewCount: 38,
      category: 'Minimalist',
      isFeatured: true,
      services: [
        'Space Optimization',
        'Minimalist Decor',
        'Functional Design',
        'Color Consultation',
      ],
      features: [
        'Clean Lines',
        'Neutral Palettes',
        'Open Spaces',
        'Functional Furniture',
      ],
      process: [
        {'step': '1', 'title': 'Assessment', 'desc': 'Evaluate space needs'},
        {'step': '2', 'title': 'Concept', 'desc': 'Propose minimalist designs'},
        {'step': '3', 'title': 'Completion', 'desc': 'Finalize the setup'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    InteriorDesignCompany(
      name: 'Industrial Vibes',
      description: 'Raw and edgy industrial interior designs',
      address: 'Mohandessin, Giza',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.3,
      reviewCount: 33,
      category: 'Industrial',
      isFeatured: false,
      services: [
        'Loft Conversions',
        'Exposed Material Design',
        'Custom Metalwork',
        'Urban Styling',
      ],
      features: [
        'Raw Materials',
        'Exposed Structures',
        'Bold Textures',
        'Industrial Lighting',
      ],
      process: [
        {'step': '1', 'title': 'Site Analysis', 'desc': 'Inspect the space'},
        {'step': '2', 'title': 'Drafting', 'desc': 'Create industrial plans'},
        {'step': '3', 'title': 'Build', 'desc': 'Construct the design'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    InteriorDesignCompany(
      name: 'Scandi Spaces',
      description: 'Cozy and functional Scandinavian designs',
      address: 'Heliopolis, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.6,
      reviewCount: 48,
      category: 'Scandinavian',
      isFeatured: true,
      services: [
        'Cozy Home Design',
        'Natural Material Use',
        'Light Enhancement',
        'Furniture Curation',
      ],
      features: [
        'Soft Textures',
        'Natural Light',
        'Wood Elements',
        'Simple Aesthetics',
      ],
      process: [
        {'step': '1', 'title': 'Meeting', 'desc': 'Discuss client vision'},
        {'step': '2', 'title': 'Design', 'desc': 'Craft Scandinavian look'},
        {'step': '3', 'title': 'Setup', 'desc': 'Install design elements'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
  ];

  List<InteriorDesignCompany> get filteredCompanies {
    return companies.where((company) {
      final matchesSearch =
          company.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              company.description
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              company.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesLocation = _selectedGovernorate == null ||
          _selectedCity == null ||
          (_selectedGovernorate != null &&
              company.address.contains(_selectedGovernorate!)) ||
          (_selectedCity != null && company.address.contains(_selectedCity!));
      return matchesSearch && matchesLocation;
    }).toList()
      ..sort((a, b) =>
          _selectedFilter == 'rating' ? b.rating.compareTo(a.rating) : 0);
  }

  List<Map<String, dynamic>> _getFilterOptions(BuildContext context) {
    return [
      {'title': S.of(context).HighestRating, 'value': 'rating'},
    ];
  }

  final Map<String, List<String>> governoratesWithCities = {
    'Cairo': [
      'Maadi',
      'Mokattam',
      'Nasr City',
      'Zamalek',
      'Dokki',
      'Heliopolis',
      'Shubra',
      'New Cairo',
      'El Marg',
    ],
    'Giza': [
      'Dokki',
      'Mohandessin',
      'Haram',
      '6th October',
      'Sheikh Zayed',
      'Faisal',
      'Bulaq Dakrour',
      'Imbaba',
    ],
    'Alexandria': [
      'Smouha',
      'Sidi Gaber',
      'Asafra',
      'Mandara',
      'Montaza',
      'Gleem',
      'Stanley',
      'Miami',
      'San Stefano',
    ],
    'Minya': [
      'New Minya',
      'Mallawi',
      'Deir Mawas',
      'Maghagha',
      'Abu Qurqas',
      'Samalout',
      'Beni Mazar',
    ],
    'Assiut': [
      'New Assiut',
      'Dayrout',
      'Sadfa',
      'El Badari',
      'Abnoub',
      'El Quseyya',
      'Manfalut',
    ],
    'Sohag': ['Akhmim', 'Gerga', 'El Maragha', 'Tahta', 'Sohag City', 'Tama'],
    'Qena': ['Qena City', 'Nag Hammadi', 'Qift', 'Farshout', 'Deshna'],
    'Luxor': ['Luxor City', 'Esna', 'Armant', 'El-Toud', 'New Tiba'],
    'Aswan': ['Aswan City', 'Kom Ombo', 'Edfu', 'Daraw', 'New Aswan'],
    'Red Sea': ['Hurghada', 'Safaga', 'Quseir', 'Marsa Alam', 'Shalateen'],
    'South Sinai': [
      'Sharm El-Sheikh',
      'Dahab',
      'Nuweiba',
      'Saint Catherine',
      'Taba'
    ],
    'North Sinai': ['Arish', 'Bir al-Abd', 'Sheikh Zuweid', 'Rafah'],
    'Ismailia': ['Ismailia City', 'Fayed', 'Qantara West', 'Tell El Kebir'],
    'Port Said': ['Port Said City', 'Port Fouad'],
    'Suez': ['Suez City', 'Ain Sokhna', 'Ataqa'],
    'Beheira': ['Damanhour', 'Kafr El Dawwar', 'Edku', 'Rashid', 'Abu Hummus'],
    'Dakahlia': ['Mansoura', 'Talkha', 'Mit Ghamr', 'Sherbin', 'Belqas'],
    'Sharqia': [
      'Zagazig',
      '10th of Ramadan',
      'Bilbeis',
      'Minya El Qamh',
      'Fakous'
    ],
    'Gharbia': [
      'Tanta',
      'El Mahalla El Kubra',
      'Kafr El Zayat',
      'Zifta',
      'Samanoud'
    ],
    'Monufia': ['Shibin El Kom', 'Sadat City', 'Ashmoun', 'Quesna', 'Menouf'],
    'Fayoum': [
      'Fayoum City',
      'Senoures',
      'Etsa',
      'Tamiya',
      'Youssef El Seddik'
    ],
    'Beni Suef': ['Beni Suef City', 'Nasser', 'Biba', 'El Wasta', 'Ihnasya'],
    'Kafr El Sheikh': [
      'Kafr El Sheikh City',
      'Desouk',
      'Baltim',
      'Motobas',
      'Fuwwah'
    ],
    'Damietta': [
      'Damietta City',
      'New Damietta',
      'Ras El Bar',
      'Ezbet El Borg',
      'Kafr Saad'
    ],
    'New Valley': ['Kharga', 'Dakhla', 'Baris', 'Farafra'],
    'Matrouh': [
      'Marsa Matrouh',
      'Siwa',
      'El Alamein',
      'Sidi Barrani',
      'Al Negila'
    ],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).InteriorDesign,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: screenWidth * 0.04),
              _buildFeaturedSection(),
              SizedBox(height: screenWidth * 0.04),
              _buildAllCompaniesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.12,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE9E9E9)),
              ),
              child: TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: S.of(context).search_for_interior_design_companies,
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.035,
                    horizontal: screenWidth * 0.02,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            flex: 1,
            child: Container(
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE9E9E9)),
              ),
              child: IconButton(
                icon: Image.asset(
                  'Assets/icons8-filter-48.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  color: KprimaryColor,
                  fit: BoxFit.contain,
                ),
                onPressed: _showAdvancedFilter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final featured =
        filteredCompanies.where((company) => company.isFeatured).toList();
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).featured_companies,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBox(
          height: screenWidth * 0.55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featured.length,
            itemBuilder: (context, index) =>
                _buildFeaturedCompanyContainer(featured[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCompanyContainer(InteriorDesignCompany company) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.4,
      margin: EdgeInsets.only(
        left: Localizations.localeOf(context).languageCode == 'ar'
            ? screenWidth * 0.02
            : 0,
        right: Localizations.localeOf(context).languageCode == 'ar'
            ? 0
            : screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _showCompanyDetails(company),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: AssetImage(company.image),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                company.name,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.001),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_outlined,
                      size: screenWidth * 0.04, color: SecondaryColor),
                  SizedBox(width: screenWidth * 0.01),
                  Flexible(
                    child: Text(
                      company.address,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: SubText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.002),
              RatingBarIndicator(
                rating: company.rating,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: SecondaryColor),
                itemCount: 5,
                itemSize: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.001),
              Text(
                company.rating.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: SubText,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllCompaniesSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final companiesList = filteredCompanies;
    if (companiesList.isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.03),
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: SubText, width: 1),
        ),
        child: Center(
          child: Text(
            S.of(context).no_companies_available,
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).companies,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: companiesList.length,
          itemBuilder: (context, index) =>
              _buildCompanyContainer(companiesList[index]),
        ),
      ],
    );
  }

  Widget _buildCompanyContainer(InteriorDesignCompany company) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showCompanyDetails(company),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: AssetImage(company.image),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: screenWidth * 0.04, color: SecondaryColor),
                      SizedBox(width: screenWidth * 0.001),
                      Text(
                        company.address,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: SubText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.star,
                    size: screenWidth * 0.05, color: SecondaryColor),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  company.rating.toStringAsFixed(1),
                  style: TextStyle(
                    color: SubText,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCompanyDetails(InteriorDesignCompany company) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InteriorDesign(
          title: company.name,
          details: company.toDetailsMap(),
        ),
      ),
    );
  }

  void _showAdvancedFilter() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              height: screenHeight * 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'Assets/icons8-filter-48.png',
                        width: screenWidth * 0.05,
                        height: screenWidth * 0.05,
                        color: KprimaryColor,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        S.of(context).SearchOptions,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
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
                  SizedBox(height: screenHeight * 0.015),
                  Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Location,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      GestureDetector(
                        onTap: () => _showAddLocationSheet(
                          context: context,
                          governoratesWithCities: governoratesWithCities,
                          onLocationSelected: (governorate, city) {
                            setState(() {
                              _selectedGovernorate = governorate;
                              _selectedCity = city;
                            });
                          },
                        ),
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.01),
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: (_selectedGovernorate != null &&
                                    _selectedCity != null)
                                ? KprimaryColor.withOpacity(0.1)
                                : KprimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (_selectedGovernorate != null &&
                                      _selectedCity != null)
                                  ? KprimaryColor
                                  : KprimaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: (_selectedGovernorate != null &&
                                  _selectedCity != null)
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          color: KprimaryColor,
                                          size: screenWidth * 0.045),
                                      SizedBox(width: screenWidth * 0.02),
                                      Expanded(
                                        child: Text(
                                          '$_selectedCity, $_selectedGovernorate',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.03,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add,
                                          color: KprimaryColor,
                                          size: screenWidth * 0.05),
                                      SizedBox(width: screenWidth * 0.02),
                                      Text(
                                        S.of(context).ChooseLocation,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.03,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    S.of(context).Rating,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  ..._getFilterOptions(context).map((option) {
                    final isSelected = _selectedFilter == option['value'];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedFilter = option['value']),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenWidth * 0.02),
                          child: Text(
                            option['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(double.infinity, screenWidth * 0.12),
                            backgroundColor: KprimaryColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: KprimaryColor, width: 3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            '${S.of(context).Show} ${filteredCompanies.length}',
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
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                Size(double.infinity, screenWidth * 0.12)),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) =>
                                        states.contains(MaterialState.disabled)
                                            ? Colors.white
                                            : Colors.white),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) =>
                                        states.contains(MaterialState.disabled)
                                            ? KprimaryColor.withOpacity(0.3)
                                            : KprimaryColor),
                            side: MaterialStateProperty.resolveWith<BorderSide>(
                                (states) => BorderSide(
                                      color: states
                                              .contains(MaterialState.disabled)
                                          ? KprimaryColor.withOpacity(0.3)
                                          : KprimaryColor,
                                      width: 1,
                                    )),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                          onPressed: (_selectedGovernorate == null &&
                                  _selectedCity == null &&
                                  _selectedFilter == 'none')
                              ? null
                              : () {
                                  setState(() {
                                    _selectedFilter = 'none';
                                    _selectedCity = null;
                                    _selectedGovernorate = null;
                                  });
                                  Navigator.pop(context);
                                },
                          child: Text(
                            S.of(context).Reset,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
        );
      },
    );
  }

  void _showAddLocationSheet({
    required BuildContext context,
    required Map<String, List<String>> governoratesWithCities,
    required void Function(String governorate, String city) onLocationSelected,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String selectedGovernorate = '';
    String selectedCity = '';
    String searchText = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: screenHeight * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: screenWidth * 0.15,
                      height: 4,
                      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).SelectLocation,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            size: screenWidth * 0.045),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (selectedGovernorate.isNotEmpty) {
                            setState(() {
                              selectedGovernorate = '';
                              selectedCity = '';
                              searchText = '';
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenWidth * 0.12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xffE9E9E9)),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.035,
                          horizontal: screenWidth * 0.02,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        hintText: S.of(context).SearchForGovernorateOrCity,
                      ),
                      onChanged: (value) => setState(() => searchText = value),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (selectedGovernorate.isEmpty)
                            ...governoratesWithCities.keys
                                .where((gov) =>
                                    searchText.isEmpty ||
                                    gov
                                        .toLowerCase()
                                        .contains(searchText.toLowerCase()))
                                .map((governorate) => Column(
                                      children: [
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.01),
                                          title: Text(
                                            governorate,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.03,
                                            ),
                                          ),
                                          onTap: () => setState(() =>
                                              selectedGovernorate =
                                                  governorate),
                                        ),
                                        Divider(
                                          color: Colors.grey.withOpacity(0.3),
                                          thickness: 1,
                                          indent: screenWidth * 0.01,
                                          endIndent: screenWidth * 0.01,
                                        ),
                                      ],
                                    ))
                          else
                            ...governoratesWithCities[selectedGovernorate]!
                                .where((city) =>
                                    searchText.isEmpty ||
                                    city
                                        .toLowerCase()
                                        .contains(searchText.toLowerCase()))
                                .map((city) => Column(
                                      children: [
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.01),
                                          title: Text(
                                            city,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.03,
                                            ),
                                          ),
                                          trailing: selectedCity == city
                                              ? Icon(Icons.check,
                                                  color: KprimaryColor,
                                                  size: screenWidth * 0.05)
                                              : null,
                                          onTap: () {
                                            onLocationSelected(
                                                selectedGovernorate, city);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Divider(
                                          color: Colors.grey.withOpacity(0.3),
                                          thickness: 1,
                                          indent: screenWidth * 0.01,
                                          endIndent: screenWidth * 0.01,
                                        ),
                                      ],
                                    )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class InteriorDesign extends StatelessWidget {
  final String title;
  final Map<String, dynamic> details;

  const InteriorDesign({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final services = details['services'] as List<dynamic>? ?? [];
    final features = details['features'] as List<dynamic>? ?? [];
    final process = details['process'] as List<dynamic>? ?? [];
    final portfolio = details['portfolio'] as List<dynamic>? ?? [];
    final image = details['image'] as String? ??
        'Assets/armchair-green-living-room-with-copy-space.jpg';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: title,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      width: double.infinity,
                      height: screenHeight * 0.3,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildErrorPlaceholder(screenSize),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionTitle(S.of(context).our_services, screenWidth),
                    ...services.map((service) =>
                        _buildServiceItem(service.toString(), screenWidth)),
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionTitle(S.of(context).design_features, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: screenWidth * 0.04,
                      mainAxisSpacing: screenHeight * 0.02,
                      childAspectRatio: 3,
                      children: features
                          .map((feature) =>
                              _buildFeatureItem(feature.toString(), screenWidth))
                          .toList(),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionTitle(S.of(context).our_process, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    ...process.map((step) => _buildProcessStep(
                          step['step']?.toString() ?? '',
                          step['title']?.toString() ?? '',
                          step['desc']?.toString() ?? '',
                          screenWidth,
                        )),
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionTitle(S.of(context).portfolio, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: screenHeight * 0.25,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: portfolio.length,
                        separatorBuilder: (_, __) =>
                            SizedBox(width: screenWidth * 0.03),
                        itemBuilder: (_, index) => _buildPortfolioItem(
                            portfolio[index].toString(), screenWidth),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.1),
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: KprimaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                color: KprimaryColor,
                                size: screenWidth * 0.06,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                S.of(context).CallUs,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: KprimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xff25D366),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'Assets/logos_whatsapp-icon.png',
                                height: screenWidth * 0.12,
                                width: screenWidth * 0.12,
                              ),
                              Text(
                                S.of(context).WhatsApp,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorPlaceholder(Size screenSize) {
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.3,
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: screenSize.width * 0.15,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
      ],
    );
  }

  Widget _buildServiceItem(String service, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            decoration: BoxDecoration(
              color: KprimaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: screenWidth * 0.05,
              color: KprimaryColor,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              service,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature, double screenWidth) {
    IconData icon;
    if (feature.toLowerCase().contains('modern')) {
      icon = Icons.design_services;
    } else if (feature.toLowerCase().contains('space')) {
      icon = Icons.space_dashboard;
    } else if (feature.toLowerCase().contains('light')) {
      icon = Icons.lightbulb;
    } else if (feature.toLowerCase().contains('color')) {
      icon = Icons.palette;
    } else if (feature.toLowerCase().contains('custom')) {
      icon = Icons.build;
    } else {
      icon = Icons.star;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: KprimaryColor,
          width: 1.5,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.02,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: KprimaryColor,
            size: screenWidth * 0.05,
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProcessStep(
      String number, String title, String description, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: const BoxDecoration(
              color: KprimaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: SubText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioItem(String imagePath, double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.04),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: KprimaryColor.withOpacity(0.4),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: screenWidth * 0.15,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
