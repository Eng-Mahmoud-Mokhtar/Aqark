import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';

class ContractingCompany {
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
  final int experience;

  ContractingCompany({
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
    required this.experience,
  });

  Map<String, dynamic> toDetailsMap() => {
    'services': services,
    'features': features,
    'process': process,
    'portfolio': portfolio,
    'image': image,
    'experience': experience,
  };
}

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit() : super(false);

  void toggleFavorite() => emit(!state);
}

class ContractingCompanies extends StatefulWidget {
  const ContractingCompanies({Key? key}) : super(key: key);

  @override
  _ContractingCompaniesState createState() => _ContractingCompaniesState();
}

class _ContractingCompaniesState extends State<ContractingCompanies> {
  String searchQuery = '';
  String? _selectedGovernorate;
  String? _selectedCity;
  String _selectedFilter = 'none';

  final List<ContractingCompany> companies = [
    ContractingCompany(
      name: 'Elite Constructions',
      description: 'Premium construction and contracting solutions',
      address: 'Nasr City, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.8,
      reviewCount: 56,
      category: 'Modern',
      isFeatured: true,
      experience: 15,
      services: [
        'Residential Construction',
        'Commercial Construction',
        'Renovation Services',
        'Structural Design',
      ],
      features: [
        'High-Quality Materials',
        'Advanced Engineering',
        'Timely Delivery',
        'Safety Compliance',
      ],
      process: [
        {
          'step': '1',
          'title': 'Consultation',
          'desc': 'Understand client needs'
        },
        {'step': '2', 'title': 'Planning', 'desc': 'Create detailed plans'},
        {'step': '3', 'title': 'Execution', 'desc': 'Implement the project'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    ContractingCompany(
      name: 'Classic Builders',
      description: 'Timeless and reliable construction services',
      address: 'Zamalek, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.7,
      reviewCount: 42,
      category: 'Classic',
      isFeatured: true,
      experience: 20,
      services: [
        'Luxury Building',
        'Restoration Works',
        'Custom Masonry',
        'Project Management',
      ],
      features: [
        'Durable Structures',
        'Traditional Techniques',
        'Eco-Friendly Materials',
        'Expert Craftsmanship',
      ],
      process: [
        {
          'step': '1',
          'title': 'Discovery',
          'desc': 'Explore client requirements'
        },
        {'step': '2', 'title': 'Design', 'desc': 'Develop construction plans'},
        {
          'step': '3',
          'title': 'Construction',
          'desc': 'Execute with precision'
        },
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    ContractingCompany(
      name: 'Minimalist Structures',
      description: 'Efficient and modern construction designs',
      address: '6th October City, Giza',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.5,
      reviewCount: 38,
      category: 'Minimalist',
      isFeatured: true,
      experience: 10,
      services: [
        'Space Optimization',
        'Modern Architecture',
        'Sustainable Building',
        'Cost Estimation',
      ],
      features: [
        'Clean Designs',
        'Energy Efficiency',
        'Open Layouts',
        'Smart Construction',
      ],
      process: [
        {'step': '1', 'title': 'Assessment', 'desc': 'Evaluate project needs'},
        {'step': '2', 'title': 'Concept', 'desc': 'Propose modern designs'},
        {'step': '3', 'title': 'Completion', 'desc': 'Finalize the build'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    ContractingCompany(
      name: 'Industrial Builders',
      description: 'Robust and industrial construction solutions',
      address: 'Mohandessin, Giza',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.3,
      reviewCount: 33,
      category: 'Industrial',
      isFeatured: false,
      experience: 12,
      services: [
        'Factory Construction',
        'Warehouse Building',
        'Heavy Machinery Setup',
        'Industrial Renovation',
      ],
      features: [
        'Rugged Materials',
        'Large-Scale Projects',
        'Heavy-Duty Structures',
        'Industrial Safety',
      ],
      process: [
        {'step': '1', 'title': 'Site Analysis', 'desc': 'Inspect the site'},
        {'step': '2', 'title': 'Drafting', 'desc': 'Create industrial plans'},
        {'step': '3', 'title': 'Build', 'desc': 'Construct the project'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
    ContractingCompany(
      name: 'Eco Constructions',
      description: 'Sustainable and eco-friendly building solutions',
      address: 'Heliopolis, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      rating: 4.6,
      reviewCount: 48,
      category: 'Sustainable',
      isFeatured: true,
      experience: 8,
      services: [
        'Green Building',
        'Solar Panel Installation',
        'Eco-Friendly Materials',
        'Energy Audits',
      ],
      features: [
        'Sustainable Materials',
        'Energy Efficiency',
        'Eco Designs',
        'Green Certifications',
      ],
      process: [
        {'step': '1', 'title': 'Meeting', 'desc': 'Discuss project vision'},
        {'step': '2', 'title': 'Design', 'desc': 'Craft sustainable plans'},
        {'step': '3', 'title': 'Setup', 'desc': 'Install eco elements'},
      ],
      portfolio: [
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
        'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      ],
    ),
  ];

  List<ContractingCompany> get filteredCompanies {
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
        title: S.of(context).Contracting,
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
                  hintText: S.of(context).search_for_contracting_companies,
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

  Widget _buildFeaturedCompanyContainer(ContractingCompany company) {
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

  Widget _buildCompanyContainer(ContractingCompany company) {
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

  void _showCompanyDetails(ContractingCompany company) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Contracting(company: company),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenWidth * 0.02),
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

class Contracting extends StatefulWidget {
  final ContractingCompany company;

  const Contracting({super.key, required this.company});

  @override
  _ContractingState createState() => _ContractingState();
}

class _ContractingState extends State<Contracting> {
  int _currentTabIndex = 0;
  double _selectedRating = 0.0;
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, dynamic>> _reviews = [
    {
      "user": "Ahmed Mohamed",
      "avatar": "Assets/user_avatar.png",
      "rating": 4.8,
      "comment": "Outstanding construction quality and professionalism.",
      "date": "3 days ago"
    },
    {
      "user": "Fatima Ali",
      "avatar": "Assets/user_avatar.png",
      "rating": 4.5,
      "comment": "Very reliable and completed the project on time.",
      "date": "1 week ago"
    },
  ];
  final List<Map<String, dynamic>> _posts = [
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Residential Building",
      "caption":
      "Completed a modern residential building in Cairo with eco-friendly materials.",
      "date": "April 2025",
    },
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Commercial Complex",
      "caption":
      "Constructed a multi-story commercial complex in Giza with advanced engineering.",
      "date": "March 2025",
    },
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Renovation Project",
      "caption":
      "Renovated a historic building in Alexandria, preserving its classic design.",
      "date": "February 2025",
    },
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Industrial Warehouse",
      "caption":
      "Built a large-scale warehouse in 6th October City with robust materials.",
      "date": "January 2025",
    },
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Sustainable Villa",
      "caption":
      "Designed and constructed a sustainable villa with solar panels in New Cairo.",
      "date": "December 2024",
    },
    {
      "image": "Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg",
      "title": "Bridge Construction",
      "caption":
      "Completed a bridge project in Suez with high safety standards.",
      "date": "November 2024",
    },
  ];

  bool _isReviewComplete = false;

  @override
  void initState() {
    super.initState();
    _reviewController.addListener(_updateReviewStatus);
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _updateReviewStatus() {
    setState(() {
      _isReviewComplete = _selectedRating > 0 && _reviewController.text.isNotEmpty;
    });
  }

  void _submitReview() {
    if (_isReviewComplete) {
      setState(() {
        _reviews.insert(0, {
          "user": "You",
          "avatar": "Assets/user_avatar.png",
          "rating": _selectedRating,
          "comment": _reviewController.text,
          "date": "Just now"
        });
        _selectedRating = 0.0;
        _reviewController.clear();
        _isReviewComplete = false;
      });
    }
  }

  Widget _buildStarRating() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRating = index + 1.0;
              _updateReviewStatus();
            });
          },
          child: Icon(
            index < _selectedRating.floor()
                ? Icons.star
                : (index < _selectedRating ? Icons.star_half : Icons.star_border),
            size: screenWidth * 0.06,
            color: SecondaryColor,
          ),
        );
      }),
    );
  }

  Widget _buildRatingIndicator(double rating) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(
            rating.floor(),
                (i) => Icon(Icons.star, size: screenWidth * 0.04, color: SecondaryColor),
          ),
        ),
        if (rating % 1 >= 0.5)
          Icon(Icons.star_half, size: screenWidth * 0.04, color: SecondaryColor),
        Row(
          children: List.generate(
            5 - rating.ceil(),
                (i) => Icon(Icons.star_border, size: screenWidth * 0.04, color: SecondaryColor),
          ),
        ),
        SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: _posts.asMap().entries.map((entry) {
        final index = entry.key;
        final post = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index == _posts.length - 1 ? 0 : screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
          ),
          child: Container(
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullScreenImage(post["image"], post["title"]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      post["image"],
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth * 0.5,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        height: screenWidth * 0.5,
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: screenWidth * 0.15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post["title"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        post["caption"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        post["date"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: SubText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: screenHeight * 0.26,
          margin: EdgeInsets.all(screenWidth * 0.04),
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Text(
                S.of(context).AddYourReview,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _buildStarRating(),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffE9E9E9)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _reviewController,
                        decoration: InputDecoration(
                          hintText: S.of(context).WriteYourReview,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.035,
                            horizontal: screenWidth * 0.02,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send,
                          color: _isReviewComplete ? KprimaryColor : SubText,
                          size: screenWidth * 0.06),
                      onPressed: _isReviewComplete ? _submitReview : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: _reviews.map((review) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02,
              ),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundImage: AssetImage(review["avatar"]),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  review["user"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                                Text(
                                  review["date"],
                                  style: TextStyle(
                                    color: SubText,
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenWidth * 0.01),
                            _buildRatingIndicator(review["rating"]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    review["comment"],
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: widget.company.name,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04),
                CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundImage: AssetImage(widget.company.image),
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.company.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    // Category removed as per request
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Details,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Icon(Icons.work_outline, size: screenWidth * 0.04),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            "${widget.company.experience} ${S.of(context).yearsExperience}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: screenWidth * 0.04),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            widget.company.address,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.star_outline, size: screenWidth * 0.04),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            '${S.of(context).Rating} : ${widget.company.rating}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        widget.company.description,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Tabs
                Container(
                  height: screenWidth * 0.12,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _currentTabIndex == 0
                                  ? KprimaryColor
                                  : Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Center(
                              child: Text(
                                "${S.of(context).Posts} (${_posts.length})",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: _currentTabIndex == 0
                                      ? Colors.white
                                      : KprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _currentTabIndex == 1
                                  ? KprimaryColor
                                  : Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Center(
                              child: Text(
                                "${S.of(context).Reviews} (${_reviews.length})",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: _currentTabIndex == 1
                                      ? Colors.white
                                      : KprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _currentTabIndex == 0 ? _buildPostsTab() : _buildReviewsTab(),
                SizedBox(height: screenWidth * 0.15),
              ],
            ),
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
                      onTap: () {
                        // Add call functionality
                      },
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
                      onTap: () {
                        // Add WhatsApp functionality
                      },
                      child: Container(
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: const Color(0xff06cd46e),
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
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String title;

  const FullScreenImage(this.imagePath, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.close,
              color: Colors.white, size: screenHeight * 0.025),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}