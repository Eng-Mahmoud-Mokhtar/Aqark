import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../Home/presentation/view_model/views/BottomHome.dart';
import 'BrokerDetailsPage.dart';

class BrokersScreen extends StatefulWidget {
  const BrokersScreen({Key? key}) : super(key: key);

  @override
  _BrokersScreenState createState() => _BrokersScreenState();
}

class _BrokersScreenState extends State<BrokersScreen> {
  String searchQuery = '';
  double minRating = 3.0;

  List<Broker> get filteredBrokers {
    return brokers.where((broker) {
      final matchesSearch = broker.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          broker.location.toLowerCase().contains(searchQuery.toLowerCase()) ||
          broker.city.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesRating = broker.rating >= minRating;
      final matchesLocation = _selectedGovernorate == null || broker.location == _selectedGovernorate;
      final matchesCity = _selectedCity == null || broker.city == _selectedCity;

      return matchesSearch && matchesRating && matchesLocation && matchesCity;
    }).toList();
  }

  List<Broker> get featuredBrokers {
    return brokers.where((broker) => broker.isFeatured).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Brokers,
        onBack: () {
          Navigator.pop(
            context,
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
              _buildFeaturedSection(),
              const SizedBox(height: 16),
              _buildAllBrokersSection(),
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
                  hintText: S.of(context).SearchForBrokers,
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

  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final featured = featuredBrokers;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).FeaturedBrokers,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featured.length,
            itemBuilder: (context, index) {
              return _buildFeaturedBrokerContainer(featured[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedBrokerContainer(Broker broker) {
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
        onTap: () => _showBrokerDetails(broker),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: AssetImage(broker.image),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                broker.name,
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
                  Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                  SizedBox(width: screenWidth * 0.01),
                  Flexible(
                    child: Text(
                      "${broker.city}, ${broker.location}",
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
                rating: broker.rating,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: SecondaryColor,
                ),
                itemCount: 5,
                itemSize: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.001),
              Text(
                '${broker.rating.toStringAsFixed(1)}',
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

  Widget _buildAllBrokersSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final brokersList = filteredBrokers;
    if (brokersList.isEmpty) {
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
            S.of(context).NoBrokersAvailable,
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
          S.of(context).Brokers,
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
          itemCount: brokersList.length,
          itemBuilder: (context, index) {
            return _buildBrokerContainer(brokersList[index]);
          },
        ),
      ],
    );
  }

  Widget _buildBrokerContainer(Broker broker) {
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
        onTap: () => _showBrokerDetails(broker),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: AssetImage(broker.image),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    broker.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                      SizedBox(width: screenWidth * 0.001),
                      Text(
                        "${broker.city}, ${broker.location}",
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
                  '${broker.rating.toStringAsFixed(1)}',
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

  void _showBrokerDetails(Broker broker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrokerDetailsPage(
          broker: {
            "name": broker.name,
            "phone": broker.phone,
            "location": broker.location,
            "city": broker.city,
            "details": broker.details,
            "image": broker.image,
            "rating": broker.rating,
            "reviews": broker.reviews,
            "isFeatured": broker.isFeatured,
          },
        ),
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
                            '${S.of(context).Show} ${filteredBrokers.length} ${S.of(context).Results}',
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
                          onPressed: (_selectedGovernorate == null && _selectedCity == null && _selectedFilter == "none")
                              ? null
                              : () {
                            setModalState(() {
                              _selectedFilter = "none";
                              _selectedCity = null;
                              _selectedGovernorate = null;
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

  final List<Broker> brokers = [
    Broker(
      name: "Ahmed Hassan",
      phone: "+20 101 234 5678",
      location: "Cairo",
      city: "New Cairo",
      details: "Luxury real estate expert with 10 years of experience.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 4.2,
      reviews: 15,
      isFeatured: true,
    ),
    Broker(
      name: "Mohamed Ali",
      phone: "+20 102 876 5432",
      location: "Alexandria",
      city: "Smouha",
      details: "Specialist in commercial properties and offices.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 3.8,
      reviews: 10,
      isFeatured: true,
    ),
    Broker(
      name: "Mahmoud Ibrahim",
      phone: "+20 103 654 3210",
      location: "Giza",
      city: "Dokki",
      details: "Experienced in residential and investment properties.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 4.5,
      reviews: 7,
      isFeatured: true,
    ),
    Broker(
      name: "Sara Khaled",
      phone: "+20 104 789 0123",
      location: "Cairo",
      city: "Nasr City",
      details: "Expert in rentals and small property deals.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 4.0,
      reviews: 5,
      isFeatured: false,
    ),
    Broker(
      name: "Ali Mostafa",
      phone: "+20 105 908 7654",
      location: "Cairo",
      city: "Maadi",
      details: "Real estate evaluator and market analyst.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 4.7,
      reviews: 12,
      isFeatured: true,
    ),
    Broker(
      name: "Yasmine Abdullah",
      phone: "+20 106 321 6789",
      location: "Giza",
      city: "Sheikh Zayed",
      details: "High-end property sales and purchases.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      rating: 4.3,
      reviews: 11,
      isFeatured: false,
    ),
  ];

  final Map<String, List<String>> governoratesWithCities = {
    "Cairo": ["Maadi", "Mokattam", "Nasr City", "Zamalek", "Dokki", "Heliopolis", "Shubra", "New Cairo", "El Marg"],
    "Giza": ["Dokki", "Mohandessin", "Haram", "6th October", "Sheikh Zayed", "Faisal", "Bulaq Dakrour", "Imbaba"],
    "Alexandria": [
      "Smouha",
      "Sidi Gaber",
      "Asafra",
      "Mandara",
      "Montaza",
      "Gleem",
      "Stanley",
      "Miami",
      "San Stefano"
    ],
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
}

class Broker {
  final String name;
  final String phone;
  final String location;
  final String city;
  final String details;
  final String image;
  final double rating;
  final int reviews;
  final bool isFeatured;

  Broker({
    required this.name,
    required this.phone,
    required this.location,
    required this.city,
    required this.details,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.isFeatured,
  });
}