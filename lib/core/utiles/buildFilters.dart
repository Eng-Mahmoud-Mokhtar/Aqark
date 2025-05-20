import 'package:flutter/material.dart';
import 'package:bk/core/utiles/constans.dart';
import 'package:intl/intl.dart';
import '../../generated/l10n.dart';

void FilterRealestate(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) {
      return Container(
        height: screenHeight * 0.7,
        child: Realestate(),
      );
    },
  );
}

class Realestate extends StatefulWidget {
  @override
  _RealestateState createState() => _RealestateState();
}

class _RealestateState extends State<Realestate> {
  int selectedIndex = -1;
  int selectedActionIndex = -1;
  int selectedTypeIndex = -1;
  double _currentSliderValue = 2000000;
  int selectedBedroomsIndex = -1;
  int selectedBathroomsIndex = -1;
  final List<String> Bedrooms = ['1', '2', '3', '4', '5+'];
  final List<String> Bathrooms = ['1', '2', '3', '4', '5+'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> categories = [
      S.of(context).Apartment,
      S.of(context).Villa,
      S.of(context).Office
    ];
    final List<String> types = [
      S.of(context).FullyFinished,
      S.of(context).SemiFinished,
      S.of(context).Unfinished
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: screenWidth * 0.04),
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
                      S.of(context).SearchFilters,
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
                Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFilterSection(
                      title: S.of(context).PropertyType,
                      items: categories,
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: screenWidth * 0.035),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    SizedBox(height: screenWidth * 0.015),
                    Text(S.of(context).PriceRange,
                        style: _sectionTitleStyle(screenWidth)),
                    Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 50000000,
                      divisions: 100,
                      activeColor: KprimaryColor,
                      inactiveColor: KprimaryColor.withOpacity(0.1),
                      label: _formatSliderValue(_currentSliderValue),
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(S.of(context).Minimum,
                            style: _labelStyle(screenWidth)),
                        Spacer(),
                        Text(S.of(context).Maximum,
                            style: _labelStyle(screenWidth)),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    buildFilterSection(
                      title: S.of(context).Bedrooms,
                      items: Bedrooms,
                      selectedIndex: selectedBedroomsIndex,
                      onTap: (index) {
                        setState(() {
                          selectedBedroomsIndex = index;
                        });
                      },
                    ),
                    buildFilterSection(
                      title: S.of(context).Bathrooms,
                      items: Bathrooms,
                      selectedIndex: selectedBathroomsIndex,
                      onTap: (index) {
                        setState(() {
                          selectedBathroomsIndex = index;
                        });
                      },
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    buildFilterSection(
                      title: S.of(context).Finishing,
                      items: types,
                      selectedIndex: selectedTypeIndex,
                      onTap: (index) {
                        setState(() {
                          selectedTypeIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: screenWidth * 0.05),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.02),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, screenWidth * 0.12),
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/home', (route) => false);
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(KprimaryColor),
                        side: MaterialStateProperty.all(
                          BorderSide(color: KprimaryColor, width: 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = -1;
                          selectedActionIndex = -1;
                          selectedTypeIndex = -1;
                          _currentSliderValue = 2000000;
                          selectedBedroomsIndex = -1;
                          selectedBathroomsIndex = -1;
                        });
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterSection({
    required String title,
    required List<String> items,
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Container(
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: index < items.length - 1 ? 5 : 0),
                    child: GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Localizations.localeOf(context).languageCode ==
                                  'ar'
                              ? screenWidth * 0.005
                              : 0,
                          right: Localizations.localeOf(context).languageCode ==
                                  'ar'
                              ? 0
                              : screenWidth * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? KprimaryColor
                              : KprimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: Directionality.of(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _sectionTitleStyle(double screenWidth) {
    return TextStyle(
      color: Colors.black,
      fontSize: screenWidth * 0.03,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _labelStyle(double screenWidth) {
    return TextStyle(
      color: SubText,
      fontSize: screenWidth * 0.03,
    );
  }

  String _formatSliderValue(double value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value.round());
  }
}

//-------------------------------------------------------------------------------------

void FilterDevelopers(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) {
      return Container(height: screenHeight * 0.7, child: FilterHomeContent());
    },
  );
}

class FilterHomeContent extends StatefulWidget {
  @override
  _FilterHomeContentState createState() => _FilterHomeContentState();
}

class _FilterHomeContentState extends State<FilterHomeContent> {
  int selectedIndex = -1;
  int selectedActionIndex = -1;
  int selectedTypeIndex = -1;
  double _currentSliderValue = 2000000;
  int selectedBedroomsIndex = -1;
  int selectedBathroomsIndex = -1;
  final List<String> Bedrooms = ['1', '2', '3', '4', '5+'];
  final List<String> Bathrooms = ['1', '2', '3', '4', '5+'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<String> categories = [
      S.of(context).Apartment,
      S.of(context).Villa,
      S.of(context).Office,
    ];
    final List<String> actions = [
      S.of(context).for_sale,
      S.of(context).for_rent,
    ];
    final List<String> types = [
      S.of(context).FullyFinished,
      S.of(context).SemiFinished,
      S.of(context).Unfinished,
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: screenWidth * 0.04),
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
                      S.of(context).SearchFilters,
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
                Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFilterSection(
                      title: S.of(context).PropertyType,
                      items: categories,
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: screenWidth * 0.035),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    SizedBox(height: screenWidth * 0.015),
                    buildFilterSection(
                      title: S.of(context).PropertyStatus,
                      items: actions,
                      selectedIndex: selectedActionIndex,
                      onTap: (index) {
                        setState(() {
                          selectedActionIndex = index;
                        });
                      },
                    ),
                    Text(S.of(context).PriceRange,
                        style: _sectionTitleStyle(screenWidth)),
                    Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 50000000,
                      divisions: 100,
                      activeColor: KprimaryColor,
                      inactiveColor: KprimaryColor.withOpacity(0.1),
                      label: _formatSliderValue(_currentSliderValue),
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(S.of(context).Minimum,
                            style: _labelStyle(screenWidth)),
                        Spacer(),
                        Text(S.of(context).Maximum,
                            style: _labelStyle(screenWidth)),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    buildFilterSection(
                      title: S.of(context).Bedrooms,
                      items: Bedrooms,
                      selectedIndex: selectedBedroomsIndex,
                      onTap: (index) {
                        setState(() {
                          selectedBedroomsIndex = index;
                        });
                      },
                    ),
                    buildFilterSection(
                      title: S.of(context).Bathrooms,
                      items: Bathrooms,
                      selectedIndex: selectedBathroomsIndex,
                      onTap: (index) {
                        setState(() {
                          selectedBathroomsIndex = index;
                        });
                      },
                    ),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    buildFilterSection(
                      title: S.of(context).Finishing,
                      items: types,
                      selectedIndex: selectedTypeIndex,
                      onTap: (index) {
                        setState(() {
                          selectedTypeIndex = index;
                        });
                      },
                    ),
                    SizedBox(height: screenWidth * 0.05),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.02),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, screenWidth * 0.12),
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/home', (route) => false);
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
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                        MaterialStateProperty.all(KprimaryColor),
                        side: MaterialStateProperty.all(
                          BorderSide(color: KprimaryColor, width: 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = -1;
                          selectedActionIndex = -1;
                          selectedTypeIndex = -1;
                          _currentSliderValue = 2000000;
                          selectedBedroomsIndex = -1;
                          selectedBathroomsIndex = -1;
                        });
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterSection({
    required String title,
    required List<String> items,
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Container(
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: index < items.length - 1 ? 5 : 0),
                    child: GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Localizations.localeOf(context).languageCode ==
                              'ar'
                              ? screenWidth * 0.005
                              : 0,
                          right: Localizations.localeOf(context).languageCode ==
                              'ar'
                              ? 0
                              : screenWidth * 0.005,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? KprimaryColor
                              : KprimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: Directionality.of(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _sectionTitleStyle(double screenWidth) {
    return TextStyle(
      color: Colors.black,
      fontSize: screenWidth * 0.03,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _labelStyle(double screenWidth) {
    return TextStyle(
      color: SubText,
      fontSize: screenWidth * 0.03,
    );
  }

  String _formatSliderValue(double value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value.round());
  }
}
