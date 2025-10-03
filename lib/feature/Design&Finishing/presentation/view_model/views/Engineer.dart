import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/ListGovernoratesWithCities.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'EngineerDetails.dart';
import 'Widgets/EngineerObjects.dart';
import 'Widgets/ListEngineers.dart';

class EngineersScreen extends StatefulWidget {
  const EngineersScreen({Key? key}) : super(key: key);

  @override
  _EngineersScreenState createState() => _EngineersScreenState();
}

class _EngineersScreenState extends State<EngineersScreen> {
  String searchQuery = '';
  String? _selectedGovernorate;
  String? _selectedCity;
  // Filter engineers based on search and location
  List<Engineer> get filteredEngineers {
    return engineers.where((engineer) {
      final matchesSearch = engineer.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          engineer.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesLocation = _selectedGovernorate == null || _selectedCity == null ||
          engineer.address.toLowerCase().contains(_selectedCity!.toLowerCase()) ||
          engineer.address.toLowerCase().contains(_selectedGovernorate!.toLowerCase());
      return matchesSearch && matchesLocation;
    }).toList();
  }

  List<Engineer> get featuredEngineers {
    return engineers.where((engineer) => engineer.isFeatured).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Engineers,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: screenWidth * 0.04),
              _buildFeaturedSection(),
              SizedBox(height: screenWidth * 0.04),
              _buildAllEngineersSection(),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: S.of(context).SearchForEngineers,
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
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

  // Featured engineers section
  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final featured = featuredEngineers;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).FeaturedEngineers,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
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
              return _buildFeaturedEngineerContainer(featured[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedEngineerContainer(Engineer engineer) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return GestureDetector(
      onTap: () => _showEngineerDetails(engineer),
      child: Container(
        width: screenWidth * 0.4,
        margin: EdgeInsets.only(
          left: isArabic ? screenWidth * 0.02 : 0,
          right: isArabic ? 0 : screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.07,
                      backgroundImage: AssetImage(engineer.image),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      engineer.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                        SizedBox(width: screenWidth * 0.01),
                        Flexible(
                          child: Text(
                            engineer.address,
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenWidth * 0.04,
              left: -screenWidth * 0.07,
              child: Transform.rotate(
                angle: -0.785398,
                child: Container(
                  width: screenWidth * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: SecondaryColor,
                  ),
                  child: Text(
                    S.of(context).Premium,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // All engineers section
  Widget _buildAllEngineersSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final engineersList = filteredEngineers;
    if (engineersList.isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.03),
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: SubText, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            S.of(context).NoEngineers,
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
          S.of(context).Engineers,
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
          itemCount: engineersList.length,
          itemBuilder: (context, index) {
            return _buildEngineerContainer(engineersList[index]);
          },
        ),
      ],
    );
  }

  // Engineer container
  Widget _buildEngineerContainer(Engineer engineer) {
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
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _showEngineerDetails(engineer),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: AssetImage(engineer.image),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    engineer.name,
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
                      Flexible(
                        child: Text(
                          engineer.address,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: SubText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEngineerDetails(Engineer engineer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EngineerDetailsScreen(engineer: engineer),
      ),
    );
  }

  void _showAdvancedFilter() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      constraints: BoxConstraints(
        maxWidth: screenWidth,
        maxHeight: screenHeight * 0.9,
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.45,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
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
                                side: const BorderSide(
                                  color: KprimaryColor,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text(
                              "${S.of(context).Show} ${featuredEngineers.length}",
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
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              foregroundColor: MaterialStateProperty.all(
                                (_selectedGovernorate == null && _selectedCity == null)
                                    ? KprimaryColor.withOpacity(0.3)
                                    : KprimaryColor,
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: (_selectedGovernorate == null && _selectedCity == null)
                                      ? KprimaryColor.withOpacity(0.3)
                                      : KprimaryColor,
                                  width: 1,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: (_selectedGovernorate == null && _selectedCity == null)
                                ? null
                                : () {
                              setState(() {
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
          ),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      constraints: BoxConstraints(
        maxWidth: screenWidth,
        maxHeight: screenHeight * 0.9,
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
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
                                    .where((city) => searchText.isEmpty ||
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
                                      trailing: _selectedCity == city
                                          ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.02),
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
          ),
        );
      },
    );
  }
}
