import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'BrokerDetailsPage.dart';

class BrokersPage extends StatefulWidget {
  const BrokersPage({super.key});

  @override
  State<BrokersPage> createState() => _BrokersPageState();
}

class _BrokersPageState extends State<BrokersPage> {
  final List<Map<String, dynamic>> brokers = [
    {
      "name": "Ahmed Hassan",
      "phone": "+20 101 234 5678",
      "location": "Cairo",
      "city": "New Cairo",
      "details": "Luxury real estate expert with 10 years of experience.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.2,
      "reviews": 15,
    },
    {
      "name": "Mohamed Ali",
      "phone": "+20 102 876 5432",
      "location": "Alexandria",
      "city": "Smouha",
      "details": "Specialist in commercial properties and offices.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 3.8,
      "reviews": 10,
    },
    {
      "name": "Mahmoud Ibrahim",
      "phone": "+20 103 654 3210",
      "location": "Giza",
      "city": "Dokki",
      "details": "Experienced in residential and investment properties.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.5,
      "reviews": 7,
    },
    {
      "name": "Sara Khaled",
      "phone": "+20 104 789 0123",
      "location": "Nasr City",
      "city": "6th District",
      "details": "Expert in rentals and small property deals.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.0,
      "reviews": 5,
    },
    {
      "name": "Ali Mostafa",
      "phone": "+20 105 908 7654",
      "location": "Maadi",
      "city": "Degla",
      "details": "Real estate evaluator and market analyst.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.7,
      "reviews": 12,
    },
    {
      "name": "Yasmine Abdullah",
      "phone": "+20 106 321 6789",
      "location": "6th October",
      "city": "Sheikh Zayed",
      "details": "High-end property sales and purchases.",
      "image": "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      "rating": 4.3,
      "reviews": 11,
    },
  ];
  String searchQuery = "";
  String _selectedFilter = "none";

  final List<Map<String, dynamic>> _filterOptions = [
    {"title": "Highest Rating", "value": "rating"},
  ];
  String? _selectedGovernorate;
  String? _selectedCity;

  void _showFilterBottomSheet() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              height: screenHeight * 0.55,
              child: Column(
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
                                Icon(Icons.location_on_outlined, color: KprimaryColor
                                    , size: screenWidth * 0.045),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: Text(
                                    '$_selectedCity , $_selectedGovernorate',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ) : Center(
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
                                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> filteredBrokers = brokers.where((broker) {
      if (searchQuery.isNotEmpty) {
        final nameMatch = broker["name"].toLowerCase().contains(searchQuery.toLowerCase());
        final locationMatch = broker["location"].toLowerCase().contains(searchQuery.toLowerCase()) ||
            broker["city"].toLowerCase().contains(searchQuery.toLowerCase());
        return nameMatch || locationMatch;
      }
      return true;
    }).toList();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Brokers',
        onBack: () {
          Navigator.pop(context);
        },
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(
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
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: 'Search by name or location',
                          hintStyle: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          isCollapsed: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.035,
                            horizontal: screenWidth * 0.02,
                          ),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.06,
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
                        onPressed: _showFilterBottomSheet,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBrokers.length,
                itemBuilder: (context, index) {
                  final broker = filteredBrokers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BrokerDetailsPage(broker: broker),
                        ),
                      );
                    },
                    child: Container(
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
                            backgroundImage: AssetImage(broker["image"]),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  broker["name"],
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        size: screenWidth * 0.04, color: SecondaryColor),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      "${broker["location"]}, ${broker["city"]}",
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
                                broker["rating"].toString(),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

