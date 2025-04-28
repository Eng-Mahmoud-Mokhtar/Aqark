import 'package:flutter/material.dart';
import 'package:bk/core/utiles/constans.dart';
import 'package:intl/intl.dart';
import '../../../../../../generated/l10n.dart';
import '../Search.dart';

Widget buildSearchBar(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    height: screenWidth * 0.12,
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
            child: Container(
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE9E9E9)),
              ),
              child: TextField(
                enabled: false,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: S.of(context).searchforProperty,
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
              onPressed: () {
                showFilterBottomSheet(context);
              },
            ),
          ),
        ),
      ],
    ),
  );
}

void showFilterBottomSheet(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: screenHeight * 0.9,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: FilterHomeContent(),
      );
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

  final List<String> categories = ['Apartment', 'Villa', 'Office', 'Shop'];
  final List<String> actions = ['For Sale', 'For Rent'];
  final List<String> types = ['Fully Finished', 'Semi Finished', 'Core & Shell'];
  final List<String> Bedrooms = ['1', '2', '3', '4', '5+'];
  final List<String> Bathrooms = ['1', '2', '3', '4', '5+'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenWidth * 0.04),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,size: screenWidth * 0.04,color: Colors.black,),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Search Filters',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  buildFilterSection(
                    title: 'Property types',
                    items: categories,
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Property Status',
                    items: actions,
                    selectedIndex: selectedActionIndex,
                    onTap: (index) {
                      setState(() {
                        selectedActionIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.035),
                  SizedBox(height: screenWidth * 0.01),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: screenWidth * 0.015),
                  Text('Price Range', style: _sectionTitleStyle(screenWidth)),
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
                      Text('Minimum', style: _labelStyle(screenWidth)),
                      Spacer(),
                      Text('Maximum', style: _labelStyle(screenWidth)),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Bedrooms',
                    items: Bedrooms,
                    selectedIndex: selectedBedroomsIndex,
                    onTap: (index) {
                      setState(() {
                        selectedBedroomsIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Bathrooms',
                    items: Bathrooms,
                    selectedIndex: selectedBathroomsIndex,
                    onTap: (index) {
                      setState(() {
                        selectedBathroomsIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Finishing',
                    items: types,
                    selectedIndex: selectedTypeIndex,
                    onTap: (index) {
                      setState(() {
                        selectedTypeIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.2),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
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
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
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
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(KprimaryColor),
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
          ),
        ],
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
                    padding: EdgeInsets.only(right: index < items.length - 1 ? 8 : 0),
                    child: GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
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
                              color: selectedIndex == index ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.03,
                            ),
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
      fontSize: screenWidth * 0.035,
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