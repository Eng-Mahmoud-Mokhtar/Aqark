import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';
import 'WorkerDetailes.dart';

class WorkersScreen extends StatefulWidget {
  const WorkersScreen({Key? key}) : super(key: key);

  @override
  _WorkersScreenState createState() =>
      _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  String searchQuery = '';
  String selectedWorkers = 'All';
  double minRating = 3.0;

  final List<String> Allworkers = [
    'All',
    'Construction',
    'Plumbing',
    'Carpentry',
    'Electrical',
    'Painting',
    'AC Repair',
  ];

  // Workers list
  final List<Worker> workers = [
    Worker(
      name: 'Ahmed Mohamed',
      profession: 'Mason',
      experience: '8 years experience',
      address: 'Nasr City, Cairo',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 4.8,
      reviewCount: 56,
      category: 'Construction',
      isFeatured: true,
    ),
    Worker(
      name: 'Mahmoud Ali',
      profession: 'Plumber',
      experience: '6 years experience',
      address: 'Maadi, Cairo',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 4.7,
      reviewCount: 42,
      category: 'Plumbing',
      isFeatured: true,
    ),
    Worker(
      name: 'Ibrahim Samy',
      profession: 'Carpenter',
      experience: '7 years experience',
      address: 'Heliopolis, Cairo',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 4.5,
      reviewCount: 38,
      category: 'Carpentry',
      isFeatured: true,
    ),
    Worker(
      name: 'Khaled Hussein',
      profession: 'Electrician',
      experience: '5 years experience',
      address: 'Zamalek, Cairo',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 4.3,
      reviewCount: 31,
      category: 'Electrical',
      isFeatured: false,
    ),
    Worker(
      name: 'Mostafa Ahmed',
      profession: 'Painter',
      experience: '4 years experience',
      address: 'Dokki, Giza',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 4.2,
      reviewCount: 24,
      category: 'Painting',
      isFeatured: false,
    ),
    Worker(
      name: 'Yasser Abdullah',
      profession: 'AC Technician',
      experience: '9 years experience',
      address: 'Sheikh Zayed, Giza',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 3.9,
      reviewCount: 68,
      category: 'AC Repair',
      isFeatured: true,
    ),
    Worker(
      name: 'Emad El-Sayed',
      profession: 'Mason',
      experience: '10 years experience',
      address: 'Mokattam, Cairo',
      image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
      rating: 2.6,
      reviewCount: 26,
      category: 'Construction',
      isFeatured: false,
    ),
  ];

  // Filter workers based on search, category and rating
  List<Worker> get filteredWorkers {
    return workers.where((worker) {
      final matchesSearch = worker.name
          .toLowerCase()
          .contains(searchQuery.toLowerCase()) ||
          worker.profession.toLowerCase().contains(searchQuery.toLowerCase()) ||
          worker.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          selectedWorkers == 'All' || worker.category == selectedWorkers;
      final matchesRating = worker.rating >= minRating;

      return matchesSearch && matchesCategory && matchesRating;
    }).toList();
  }

  // Get featured workers
  List<Worker> get featuredWorkers {
    return workers.where((worker) => worker.isFeatured).toList();
  }

  // Get workers by selected category
  List<Worker> get workersByCategory {
    if (selectedWorkers == 'All') return filteredWorkers;
    return filteredWorkers
        .where((worker) => worker.category == selectedWorkers)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Workers',
        onBack: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
                (route) => false,
          );        },
        showSearch: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategoriesRow(),
              const SizedBox(height: 16),
              _buildFeaturedSection(),
              const SizedBox(height: 16),
              _buildAllWorkersSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Search bar
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
                        hintText: 'Search for workers',
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
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      )))),
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

  // Categories row
  Widget _buildCategoriesRow() {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Allworkers.length,
        itemBuilder: (context, index) {
          final isSelected = selectedWorkers == Allworkers[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWorkers = Allworkers[index];
              });
            },
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
                color: isSelected ? KprimaryColor
                    : KprimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),),
              child: Center(
                child: Text(
                  Allworkers[index],
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Featured workers section
  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    if (selectedWorkers != 'All') return const SizedBox.shrink();
    final featured = featuredWorkers;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Workers',
          style: TextStyle(
            fontSize: screenWidth*0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featured.length,
            itemBuilder: (context, index) {
              return _buildFeaturedWorkerContainer(featured[index]);
            },
          ),
        ),
      ],
    );
  }

  // Featured worker container
  Widget _buildFeaturedWorkerContainer(Worker worker) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.4,
      margin: EdgeInsets.only(
        left: Localizations.localeOf(context).languageCode == 'ar' ? screenWidth * 0.02 : 0,
        right: Localizations.localeOf(context).languageCode == 'ar' ? 0 : screenWidth * 0.02,
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
        onTap: () => _showWorkerDetails(worker),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: AssetImage(worker.image),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                worker.name,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.001),
              Text(
                worker.profession,
                style: TextStyle(
                  color: KprimaryColor,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
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
                      worker.address,
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
                rating: worker.rating,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: SecondaryColor,
                ),
                itemCount: 5,
                itemSize: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.001),
              Text(
                '${worker.rating.toStringAsFixed(1)}',
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

  Widget _buildAllWorkersSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final workersList = workersByCategory;
    if (workersList.isEmpty) {
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
            'No workers available',
            style: TextStyle(
              fontSize: screenWidth*0.035,
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
          'All Workers',
          style: TextStyle(
            fontSize: screenWidth*0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: workersList.length,
          itemBuilder: (context, index) {
            return _buildWorkerContainer(workersList[index]);
          },
        ),
      ],
    );
  }

  // Worker container
  Widget _buildWorkerContainer(Worker worker) {
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
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.07,
            backgroundImage: AssetImage(worker.image),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  worker.name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Text(
                  worker.profession,
                  style: TextStyle(
                    color: KprimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: screenWidth * 0.04, color: SecondaryColor),
                    SizedBox(width: screenWidth * 0.001),
                    Text(
                      worker.address ,
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
                  size: screenWidth * 0.05,
                  color: SecondaryColor),
              SizedBox(height: screenWidth * 0.01),
              Text(
                '${worker.rating.toStringAsFixed(1)}',
                style: TextStyle(
                  color: SubText,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showWorkerDetails(Worker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkerDetailsScreen(worker: Worker),
      ),
    );
  }
  final List<Map<String, dynamic>> _filterOptions = [
    {"title": "Highest Rating", "value": "rating"},
  ];
  final Map<String, List<String>> governoratesWithCities = {
    "Cairo": ["Maadi", "Mokattam", "Nasr City", "Zamalek", "Dokki", "Heliopolis", "Shubra", "New Cairo", "El Marg"],
    "Giza": ["Dokki", "Mohandessin", "Haram", "6th October", "Sheikh Zayed", "Faisal", "Bulaq Dakrour", "Imbaba"],
    "Alexandria": ["Smouha", "Sidi Gaber", "Asafra", "Mandara", "Montaza", "Gleem", "Stanley", "Miami", "San Stefano"],
    "Minya": ["New Minya", "Mallawi", "Deir Mawas", "Maghagha", "Abu Qurqas", "Samalout", "Beni Mazar"],
    "Assiut": ["New Assiut", "Dayrout", "Sadfa", "El Badari", "Abnoub", "El Quseyya", "Manfalut"],
    "Sohag": ["Akhmim", "Gerga", "El Maragha", "Tahta", "Sohag City", "Tama"],
    "Qena": ["Qena City", "Nag Hammadi", "Qift", "Farshout", "Deshna"],
    "Luxor": ["Luxor City", "Esna", "Armant", "El-Toud", "New Tiba"],
    "Aswan": ["Aswan City", "Kom Ombo", "Edfu", "Daraw", "New Aswan"],
    "Red Sea": ["Hurghada", "Safaga", "Quseir", "Marsa Alam", "Shalateen"],
    "South Sinai": ["Sharm El-Sheikh", "Dahab", "Nuweiba", "Saint Catherine", "Taba"],
    "North Sinai": ["Arish", "Bir al-Abd", "Sheikh Zuweid", "Rafah"],
    "Ismailia": ["Ismailia City", "Fayed", "Qantara West", "Tell El Kebir"],
    "Port Said": ["Port Said City", "Port Fouad"],
    "Suez": ["Suez City", "Ain Sokhna", "Ataqa"],
    "Beheira": ["Damanhour", "Kafr El Dawwar", "Edku", "Rashid", "Abu Hummus"],
    "Dakahlia": ["Mansoura", "Talkha", "Mit Ghamr", "Sherbin", "Belqas"],
    "Sharqia": ["Zagazig", "10th of Ramadan", "Bilbeis", "Minya El Qamh", "Fakous"],
    "Gharbia": ["Tanta", "El Mahalla El Kubra", "Kafr El Zayat", "Zifta", "Samanoud"],
    "Monufia": ["Shibin El Kom", "Sadat City", "Ashmoun", "Quesna", "Menouf"],
    "Fayoum": ["Fayoum City", "Senoures", "Etsa", "Tamiya", "Youssef El Seddik"],
    "Beni Suef": ["Beni Suef City", "Nasser", "Biba", "El Wasta", "Ihnasya"],
    "Kafr El Sheikh": ["Kafr El Sheikh City", "Desouk", "Baltim", "Motobas", "Fuwwah"],
    "Damietta": ["Damietta City", "New Damietta", "Ras El Bar", "Ezbet El Borg", "Kafr Saad"],
    "New Valley": ["Kharga", "Dakhla", "Baris", "Farafra"],
    "Matrouh": ["Marsa Matrouh", "Siwa", "El Alamein", "Sidi Barrani", "Al Negila"],
  };
  String? _selectedGovernorate;
  String? _selectedCity;
  String _selectedFilter = "none";
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
              height: screenHeight * 0.7,
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
                        'Search Options',
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
                  SizedBox(height: screenHeight * 0.015),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    thickness: 1,
                  ),

                  // Location Section (بدون تغيير)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      GestureDetector(
                        onTap: () {
                          _showAddLocationSheet(
                            context: context,
                            governoratesWithCities: governoratesWithCities,
                            onLocationSelected: (governorate, city) {
                              setState(() {
                                _selectedGovernorate = governorate;
                                _selectedCity = city;
                              });
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: (_selectedGovernorate != null && _selectedCity != null)
                                ? KprimaryColor.withOpacity(0.1)
                                : KprimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (_selectedGovernorate != null && _selectedCity != null)
                                  ? KprimaryColor
                                  : KprimaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: (_selectedGovernorate != null && _selectedCity != null)
                              ? Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: KprimaryColor, size: screenWidth * 0.045),
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
                                Icon(Icons.add, color: KprimaryColor, size: screenWidth * 0.05),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'Choose Location',
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

                  // Category Section (المعدل بنفس التصميم مع تغيير البيانات)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Workers',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      GestureDetector(
                        onTap: () {
                          _showAddWorkers(
                            context: context,
                            categories: Allworkers,
                            onCategorySelected: (category) {
                              setState(() {
                                selectedWorkers = category;
                              });
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: (selectedWorkers != 'All')
                                ? KprimaryColor.withOpacity(0.1)
                                : KprimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (selectedWorkers != 'All')
                                  ? KprimaryColor
                                  : KprimaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: (selectedWorkers != 'All')
                              ? Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_bag_outlined, color: KprimaryColor, size: screenWidth * 0.045),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: Text(
                                    selectedWorkers,
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
                                Icon(Icons.add, color: KprimaryColor, size: screenWidth * 0.05),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'Choose Worker Role',
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
                    'Rating',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  ..._filterOptions.map((option) {
                    bool isSelected = _selectedFilter == option['value'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = option['value'];
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          color: isSelected ? KprimaryColor.withOpacity(0.1)
                              : KprimaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? KprimaryColor
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
                  }).toList(),
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
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, screenWidth * 0.12),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white;
                              }
                              return Colors.white;
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.disabled)) {
                                return KprimaryColor.withOpacity(0.3);
                              }
                              return KprimaryColor;
                            }),
                            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                              return BorderSide(
                                color: (states.contains(MaterialState.disabled))
                                    ? KprimaryColor.withOpacity(0.3)
                                    : KprimaryColor,
                                width: 1,
                              );
                            }),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: (_selectedGovernorate == null &&
                              _selectedCity == null &&
                              _selectedFilter == "none")
                              ? null
                              : () {
                            setState(() {
                              _selectedFilter = "none";
                              _selectedCity = null;
                              _selectedGovernorate = null;
                              selectedWorkers = 'All';
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
                  )
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

    String selectedGovernorate = "";
    String selectedCity = "";
    String searchText = "";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
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
                        'Select Location',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: screenWidth * 0.045,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          if (selectedGovernorate.isNotEmpty) {
                            setState(() {
                              selectedGovernorate = "";
                              selectedCity = "";
                              searchText = "";
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
                          padding: EdgeInsets.only(left: screenWidth * 0.01),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        hintText: 'Search for governorate or city',
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
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
                                gov.toLowerCase().contains(searchText.toLowerCase()))
                                .map((governorate) => Column(
                              children: [
                                ListTile(
                                  dense: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                                  title: Text(
                                    governorate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedGovernorate = governorate;
                                      searchText = "";
                                    });
                                  },
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(0.3),
                                  thickness: 1,
                                  indent: screenWidth * 0.01,
                                  endIndent: screenWidth * 0.01,
                                ),
                              ],
                            ))
                                .toList()
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: governoratesWithCities[selectedGovernorate]!
                                  .where((city) =>
                              searchText.isEmpty ||
                                  city.toLowerCase().contains(searchText.toLowerCase()))
                                  .map((city) => Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
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
                                        color: KprimaryColor, size: screenWidth * 0.05)
                                        : null,
                                    onTap: () {
                                      onLocationSelected(selectedGovernorate, city);
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
                              ))
                                  .toList(),
                            ),
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

  void _showAddWorkers({
    required BuildContext context,
    required List<String> categories,
    required Function(String) onCategorySelected,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: screenHeight * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Role',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: screenWidth * 0.045,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(category, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                          ),),
                          onTap: () {
                            onCategorySelected(category);
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
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Worker {
  final String name;
  final String profession;
  final String experience;
  final String address;
  final String image;
  final double rating;
  final int reviewCount;
  final String category;
  final bool isFeatured;

  Worker({
    required this.name,
    required this.profession,
    required this.experience,
    required this.address,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.isFeatured,
  });
}


