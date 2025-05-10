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
  _WorkersScreenState createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  String searchQuery = '';
  String? selectedWorkers;
  double minRating = 3.0;

  String getTranslatedProfession(BuildContext context, String professionId) {
    switch (professionId) {
      case 'mason':
        return S.of(context).Mason;
      case 'plumber':
        return S.of(context).Plumber;
      case 'carpenter':
        return S.of(context).Carpenter;
      case 'electrician':
        return S.of(context).Electrician;
      case 'painter':
        return S.of(context).Painter;
      case 'ac_technician':
        return S.of(context).ACTechnician;
      default:
        return professionId;
    }
  }

  List<Map<String, String>> getAllworkers(BuildContext context) => [
    {'id': 'all', 'name': S.of(context).all},
    {'id': 'construction', 'name': S.of(context).Construction},
    {'id': 'plumbing', 'name': S.of(context).Plumbing},
    {'id': 'carpentry', 'name': S.of(context).Carpentry},
    {'id': 'electrical', 'name': S.of(context).Electrical},
    {'id': 'painting', 'name': S.of(context).Painting},
    {'id': 'ac_repair', 'name': S.of(context).ACRepair},
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedWorkers ??= 'all';
  }

  List<Worker> get filteredWorkers {
    return workers.where((worker) {
      final matchesSearch = worker.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          getTranslatedProfession(context, worker.profession)
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          worker.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory = selectedWorkers == 'all' || worker.category == selectedWorkers;
      final matchesRating = worker.rating >= minRating;

      return matchesSearch && matchesCategory && matchesRating;
    }).toList();
  }

  List<Worker> get featuredWorkers {
    return workers.where((worker) => worker.isFeatured).toList();
  }

  List<Worker> get workersByCategory {
    if (selectedWorkers == 'all') return filteredWorkers;
    return filteredWorkers.where((worker) => worker.category == selectedWorkers).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Workers,
        onBack: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
                (route) => false,
          );
        },
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
                  hintText: S.of(context).SearchForWorkers,
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
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
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

  Widget _buildCategoriesRow() {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getAllworkers(context).length,
        itemBuilder: (context, index) {
          final category = getAllworkers(context)[index];
          final isSelected = selectedWorkers == category['id'];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWorkers = category['id'];
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
                color: isSelected ? KprimaryColor : KprimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  category['name']!,
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

  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    if (selectedWorkers != 'all') return const SizedBox.shrink();
    final featured = featuredWorkers;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).FeaturedWorkers,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.55,
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
                getTranslatedProfession(context, worker.profession),
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
                  Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
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
            S.of(context).NoWorkersAvailable,
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
          S.of(context).Workers,
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
          itemCount: workersList.length,
          itemBuilder: (context, index) {
            return _buildWorkerContainer(workersList[index]);
          },
        ),
      ],
    );
  }

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
                  getTranslatedProfession(context, worker.profession),
                  style: TextStyle(
                    color: KprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.03,
                  ),
                ),
                SizedBox(height: screenHeight * 0.001),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                    SizedBox(width: screenWidth * 0.001),
                    Text(
                      worker.address,
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
              Icon(Icons.star, size: screenWidth * 0.05, color: SecondaryColor),
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
  void _showWorkerDetails(Worker worker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkerDetailsScreen(worker: worker),
      ),
    );
  }
  final List<Map<String, dynamic>> _filterOptions = [
    {"title": "HighestRating", "value": "rating"},
  ];
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
          builder: (context, setModalState) {
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
                        S.of(context).SearchOptions,
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
                        onTap: () {
                          _showAddLocationSheet(
                            context: context,
                            governoratesWithCities: governoratesWithCities,
                            onLocationSelected: (governorate, city) {
                              setModalState(() {
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
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: KprimaryColor, size: screenWidth * 0.045),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Workers,
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
                            categories: getAllworkers(context),
                            onCategorySelected: (categoryId) {
                              setModalState(() {
                                selectedWorkers = categoryId;
                              });
                              setState(() {});
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: (selectedWorkers != 'all')
                                ? KprimaryColor.withOpacity(0.1)
                                : KprimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (selectedWorkers != 'all') ? KprimaryColor : KprimaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: (selectedWorkers != 'all')
                              ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_bag_outlined,
                                    color: KprimaryColor, size: screenWidth * 0.045),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: Text(
                                    getAllworkers(context)
                                        .firstWhere((cat) => cat['id'] == selectedWorkers)['name']!,
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
                                  S.of(context).ChooseWorkerRole,
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
                  ..._filterOptions.map((option) {
                    bool isSelected = _selectedFilter == option['value'];
                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          _selectedFilter = option['value'];
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: isSelected ? KprimaryColor.withOpacity(0.1) : KprimaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? KprimaryColor : KprimaryColor.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: Text(
                            S.of(context).HighestRating,
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
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text(
                            '${S.of(context).Show} ${filteredWorkers.length} ${S.of(context).Results}',
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
                            foregroundColor: KprimaryColor,
                            side: BorderSide(
                              color: KprimaryColor,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: (_selectedGovernorate == null &&
                              _selectedCity == null &&
                              _selectedFilter == "none" &&
                              selectedWorkers == 'all')
                              ? null
                              : () {
                            setModalState(() {
                              _selectedFilter = "none";
                              _selectedCity = null;
                              _selectedGovernorate = null;
                              selectedWorkers = 'all';
                            });
                            setState(() {});
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                        icon: Icon(
                          Icons.close,
                          size: screenWidth * 0.045,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (selectedGovernorate.isNotEmpty) {
                            setModalState(() {
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
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        hintText: S.of(context).SearchForGovernorateOrCity,
                      ),
                      onChanged: (value) {
                        setModalState(() {
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
                            searchText.isEmpty || gov.toLowerCase().contains(searchText.toLowerCase()))
                                .map((governorate) => Column(
                              children: [
                                ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                                  title: Text(
                                    governorate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                  onTap: () {
                                    setModalState(() {
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
                              searchText.isEmpty || city.toLowerCase().contains(searchText.toLowerCase()))
                                  .map((city) => Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                                    title: Text(
                                      city,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.03,
                                      ),
                                    ),
                                    trailing: _selectedCity == city
                                        ? Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                      child: Icon(
                                        Icons.check,
                                        color: KprimaryColor,
                                        size: screenWidth * 0.05,
                                      ),
                                    )
                                        : null,
                                    onTap: () {
                                      setModalState(() {
                                        selectedCity = city;
                                      });
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
    required List<Map<String, String>> categories,
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
          decoration: const BoxDecoration(
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
                    S.of(context).SelectRole,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
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
                          contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          title: Text(
                            category['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                          trailing: selectedWorkers == category['id']
                              ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: Icon(
                              Icons.check,
                              color: KprimaryColor,
                              size: screenWidth * 0.05,
                            ),
                          )
                              : null,
                          onTap: () {
                            onCategorySelected(category['id']!);
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

final List<Worker> workers = [
  Worker(
    name: 'Ahmed Mohamed',
    profession: 'mason',
    experience: '8',
    address: 'Nasr City, Cairo',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 4.8,
    reviewCount: 56,
    category: 'construction',
    isFeatured: true,
  ),
  Worker(
    name: 'Mahmoud Ali',
    profession: 'plumber',
    experience: '6',
    address: 'Maadi, Cairo',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 4.7,
    reviewCount: 42,
    category: 'plumbing',
    isFeatured: true,
  ),
  Worker(
    name: 'Ibrahim Samy',
    profession: 'carpenter',
    experience: '7',
    address: 'Heliopolis, Cairo',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 4.5,
    reviewCount: 38,
    category: 'carpentry',
    isFeatured: true,
  ),
  Worker(
    name: 'Khaled Hussein',
    profession: 'electrician',
    experience: '5',
    address: 'Zamalek, Cairo',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 4.3,
    reviewCount: 31,
    category: 'electrical',
    isFeatured: false,
  ),
  Worker(
    name: 'Mostafa Ahmed',
    profession: 'painter',
    experience: '4',
    address: 'Dokki, Giza',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 4.2,
    reviewCount: 24,
    category: 'painting',
    isFeatured: false,
  ),
  Worker(
    name: 'Yasser Abdullah',
    profession: 'ac_technician',
    experience: '9',
    address: 'Sheikh Zayed, Giza',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 3.9,
    reviewCount: 68,
    category: 'ac_repair',
    isFeatured: true,
  ),
  Worker(
    name: 'Emad El-Sayed',
    profession: 'mason',
    experience: '10',
    address: 'Mokattam, Cairo',
    image: 'Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG',
    rating: 2.6,
    reviewCount: 26,
    category: 'construction',
    isFeatured: false,
  ),
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