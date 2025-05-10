import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import 'Widgets/ShopMaterial.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  _MaterialsScreenState createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<Materials> {
  String searchQuery = '';
  String selectedCategory = 'All';
  double minRating = 3.0;

  // Categories
  final List<String> categories = [
    'All',
    'Cement',
    'Bricks',
    'Steel',
    'Paints',
    'Tiles',
    'Plumbing',
    'Electrical',
  ];

  // Materials list
  final List<MaterialShop> shops = [
    MaterialShop(
      name: 'El-Madina Cement',
      type: 'Cement',
      description: 'Specialized in all types of construction cement',
      address: 'Nasr City, Cairo',
      image:
      'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg',
      rating: 4.8,
      reviewCount: 56,
      category: 'Cement',
      isFeatured: true,
      products: [
        ShopProduct('Portland Cement', '50 EGP/bag',
            'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg'),
        ShopProduct('White Cement', '75 EGP/bag',
            'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Sanitary Hub',
      type: 'Plumbing',
      description:
      'Specialized in all types of plumbing materials and accessories',
      address: 'Nasr City, Cairo',
      image: 'Assets/side-view-man-working-as-plumber.jpg',
      rating: 4.7,
      reviewCount: 42,
      category: 'Plumbing',
      isFeatured: true,
      products: [
        ShopProduct('PPR Pipe 1 inch', '90 EGP/meter',
            'Assets/side-view-man-working-as-plumber.jpg'),
        ShopProduct('Brass Basin Mixer', '450 EGP',
            'Assets/side-view-man-working-as-plumber.jpg'),
        ShopProduct('Stainless Steel Floor Drain', '120 EGP',
            'Assets/side-view-man-working-as-plumber.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Egypt Bricks / طوب مصر',
      type: 'Bricks',
      description: 'High quality red and white bricks',
      address: '6th October City',
      image: 'Assets/brick-piles-placed-factory-floor.jpg',
      rating: 4.7,
      reviewCount: 42,
      category: 'Bricks',
      isFeatured: true,
      products: [
        ShopProduct('Red Clay Bricks', '1.2 EGP/brick',
            'Assets/brick-piles-placed-factory-floor.jpg'),
        ShopProduct('White Bricks', '1.5 EGP/brick',
            'Assets/brick-piles-placed-factory-floor.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Ezz Steel / حديد عز',
      type: 'Steel',
      description: 'Construction steel of all diameters',
      address: 'Downtown, Cairo',
      image: 'Assets/arc-welding-steel-construction-site.jpg',
      rating: 4.5,
      reviewCount: 38,
      category: 'Steel',
      isFeatured: true,
      products: [
        ShopProduct('8mm Rebar', '15,000 EGP/ton',
            'Assets/arc-welding-steel-construction-site.jpg'),
        ShopProduct('12mm Rebar', '16,000 EGP/ton',
            'Assets/arc-welding-steel-construction-site.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Jotun Paints / جوتن للدهانات',
      type: 'Paints',
      description: 'Premium interior and exterior paints',
      address: 'Heliopolis, Cairo',
      image: 'Assets/top-view-paint-can.jpg',
      rating: 4.3,
      reviewCount: 33,
      category: 'Paints',
      isFeatured: false,
      products: [
        ShopProduct(
            'Jotun Majesty', '650 EGP/gallon', 'Assets/top-view-paint-can.jpg'),
        ShopProduct('Jotun Weatherguard', '700 EGP/gallon',
            'Assets/top-view-paint-can.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Electro World',
      type: 'Electrical',
      description: 'High-quality electrical supplies for homes and businesses',
      address: 'El-Matarya, Cairo',
      image:
      'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg',
      rating: 4.6,
      reviewCount: 48,
      category: 'Electrical',
      isFeatured: true,
      products: [
        ShopProduct('LED Ceiling Light', '120 EGP/pc',
            'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
        ShopProduct('Electrical Cable 100m', '950 EGP/roll',
            'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
        ShopProduct('Wall Switch Set', '200 EGP/set',
            'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Cleopatra Tiles / كليوباترا للسيراميك',
      type: 'Tiles',
      description: 'Ceramic and porcelain tiles',
      address: 'Mohandessin, Giza',
      image: 'Assets/still-life-putting-up-decorative-vinyls.jpg',
      rating: 4.2,
      reviewCount: 24,
      category: 'Tiles',
      isFeatured: false,
      products: [
        ShopProduct('60x60cm Ceramic', '120 EGP/m2',
            'Assets/still-life-putting-up-decorative-vinyls.jpg'),
        ShopProduct('80x80cm Porcelain', '180 EGP/m2',
            'Assets/still-life-putting-up-decorative-vinyls.jpg'),
      ],
    ),
  ];

  // Filter shops based on search, category, and rating
  List<MaterialShop> get filteredShops {
    return shops.where((shop) {
      final matchesSearch =
          shop.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              shop.type.toLowerCase().contains(searchQuery.toLowerCase()) ||
              shop.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          selectedCategory == 'All' || shop.category == selectedCategory;
      final matchesRating = shop.rating >= minRating;

      return matchesSearch && matchesCategory && matchesRating;
    }).toList();
  }

  // Get featured shops
  List<MaterialShop> get featuredShops {
    return shops.where((shop) => shop.isFeatured).toList();
  }

  // Get shops by selected category
  List<MaterialShop> get shopsByCategory {
    if (selectedCategory == 'All') return filteredShops;
    return filteredShops
        .where((shop) => shop.category == selectedCategory)
        .toList();
  }

  // Helper method to get localized category name
  String getCategoryDisplayName(BuildContext context, String category) {
    switch (category) {
      case 'All':
        return S.of(context).all;
      case 'Cement':
        return S.of(context).Cement;
      case 'Bricks':
        return S.of(context).Bricks;
      case 'Steel':
        return S.of(context).Steel;
      case 'Paints':
        return S.of(context).Paints;
      case 'Tiles':
        return S.of(context).Tiles;
      case 'Plumbing':
        return S.of(context).Plumbing;
      case 'Electrical':
        return S.of(context).Electrical;
      default:
        return category;
    }
  }

  List<Map<String, dynamic>> _getFilterOptions(BuildContext context) {
    return [
      {"title": S.of(context).HighestRating, "value": "rating"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Materials,
        onBack: () {
          Navigator.pop(context);
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
              _buildAllShopsSection(),
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
                  hintText: S.of(context).search_for_material_shops,
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

  // Categories row
  Widget _buildCategoriesRow() {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategory == categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categories[index];
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Localizations.localeOf(context).languageCode == 'ar'
                    ? screenWidth * 0.02
                    : 0,
                right: Localizations.localeOf(context).languageCode == 'ar'
                    ? 0
                    : screenWidth * 0.02,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02,
              ),
              decoration: BoxDecoration(
                color:
                isSelected ? KprimaryColor : KprimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  getCategoryDisplayName(context, categories[index]),
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

  // Featured shops section
  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    if (selectedCategory != 'All') return const SizedBox.shrink();
    final featured = featuredShops;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).featured_shops,
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
              return _buildFeaturedShopContainer(featured[index]);
            },
          ),
        ),
      ],
    );
  }

  // Featured shop container
  Widget _buildFeaturedShopContainer(MaterialShop shop) {
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
        onTap: () => _showShopDetails(shop),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: AssetImage(shop.image),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                shop.name,
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
                getCategoryDisplayName(context, shop.type),
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
                      shop.address,
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
                rating: shop.rating,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: SecondaryColor,
                ),
                itemCount: 5,
                itemSize: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.001),
              Text(
                '${shop.rating.toStringAsFixed(1)}',
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

  Widget _buildAllShopsSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final shopsList = shopsByCategory;
    if (shopsList.isEmpty) {
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
            S.of(context).no_shops_available,
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
          S.of(context).shops,
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
          itemCount: shopsList.length,
          itemBuilder: (context, index) {
            return _buildShopContainer(shopsList[index]);
          },
        ),
      ],
    );
  }

  // Shop container
  Widget _buildShopContainer(MaterialShop shop) {
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
        onTap: () => _showShopDetails(shop),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: AssetImage(shop.image),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),
                  Text(
                    getCategoryDisplayName(context, shop.type),
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
                        shop.address,
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
                  '${shop.rating.toStringAsFixed(1)}',
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

  void _showShopDetails(MaterialShop shop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopDetailsScreen(shop: shop),
      ),
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
                        S.of(context).SelectLocation,
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
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        hintText: S.of(context).SearchForGovernorateOrCity,
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
                                .where((gov) => searchText.isEmpty ||
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
                                  .where((city) => searchText.isEmpty ||
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

  final Map<String, List<String>> governoratesWithCities = {
    "Cairo": [
      "Maadi",
      "Mokattam",
      "Nasr City",
      "Zamalek",
      "Dokki",
      "Heliopolis",
      "Shubra",
      "New Cairo",
      "El Marg"
    ],
    "Giza": [
      "Dokki",
      "Mohandessin",
      "Haram",
      "6th October",
      "Sheikh Zayed",
      "Faisal",
      "Bulaq Dakrour",
      "Imbaba"
    ],
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
    "Minya": [
      "New Minya",
      "Mallawi",
      "Deir Mawas",
      "Maghagha",
      "Abu Qurqas",
      "Samalout",
      "Beni Mazar"
    ],
    "Assiut": [
      "New Assiut",
      "Dayrout",
      "Sadfa",
      "El Badari",
      "Abnoub",
      "El Quseyya",
      "Manfalut"
    ],
    "Sohag": ["Akhmim", "Gerga", "El Maragha", "Tahta", "Sohag City", "Tama"],
    "Qena": ["Qena City", "Nag Hammadi", "Qift", "Farshout", "Deshna"],
    "Luxor": ["Luxor City", "Esna", "Armant", "El-Toud", "New Tiba"],
    "Aswan": ["Aswan City", "Kom Ombo", "Edfu", "Daraw", "New Aswan"],
    "Red Sea": ["Hurghada", "Safaga", "Quseir", "Marsa Alam", "Shalateen"],
    "South Sinai": [
      "Sharm El-Sheikh",
      "Dahab",
      "Nuweiba",
      "Saint Catherine",
      "Taba"
    ],
    "North Sinai": ["Arish", "Bir al-Abd", "Sheikh Zuweid", "Rafah"],
    "Ismailia": [
      "Ismailia City",
      "Fayed",
      "Qantara West",
      "Tell El Kebir"
    ],
    "Port Said": ["Port Said City", "Port Fouad"],
    "Suez": ["Suez City", "Ain Sokhna", "Ataqa"],
    "Beheira": [
      "Damanhour",
      "Kafr El Dawwar",
      "Edku",
      "Rashid",
      "Abu Hummus"
    ],
    "Dakahlia": [
      "Mansoura",
      "Talkha",
      "Mit Ghamr",
      "Sherbin",
      "Belqas"
    ],
    "Sharqia": [
      "Zagazig",
      "10th of Ramadan",
      "Bilbeis",
      "Minya El Qamh",
      "Fakous"
    ],
    "Gharbia": [
      "Tanta",
      "El Mahalla El Kubra",
      "Kafr El Zayat",
      "Zifta",
      "Samanoud"
    ],
    "Monufia": [
      "Shibin El Kom",
      "Sadat City",
      "Ashmoun",
      "Quesna",
      "Menouf"
    ],
    "Fayoum": [
      "Fayoum City",
      "Senoures",
      "Etsa",
      "Tamiya",
      "Youssef El Seddik"
    ],
    "Beni Suef": [
      "Beni Suef City",
      "Nasser",
      "Biba",
      "El Wasta",
      "Ihnasya"
    ],
    "Kafr El Sheikh": [
      "Kafr El Sheikh City",
      "Desouk",
      "Baltim",
      "Motobas",
      "Fuwwah"
    ],
    "Damietta": [
      "Damietta City",
      "New Damietta",
      "Ras El Bar",
      "Ezbet El Borg",
      "Kafr Saad"
    ],
    "New Valley": ["Kharga", "Dakhla", "Baris", "Farafra"],
    "Matrouh": [
      "Marsa Matrouh",
      "Siwa",
      "El Alamein",
      "Sidi Barrani",
      "Al Negila"
    ],
  };

  String? _selectedGovernorate;
  String? _selectedCity;
  String _selectedFilter = "none";

  // Show advanced filter
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
                        S.of(context).category,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      GestureDetector(
                        onTap: () {
                          _showAddCategorySheet(
                            context: context,
                            categories: categories,
                            onCategorySelected: (category) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: (selectedCategory != 'All')
                                ? KprimaryColor.withOpacity(0.1)
                                : KprimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: (selectedCategory != 'All')
                                  ? KprimaryColor
                                  : KprimaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: (selectedCategory != 'All')
                              ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Icon(Icons.category_outlined,
                                    color: KprimaryColor, size: screenWidth * 0.045),
                                SizedBox(width: screenWidth * 0.02),
                                Expanded(
                                  child: Text(
                                    getCategoryDisplayName(context, selectedCategory),
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
                                  S.of(context).choose_category,
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
                              horizontal: screenWidth * 0.03, vertical: screenWidth * 0.02),
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
                            "${S.of(context).Show} 52",
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
                              selectedCategory = 'All';
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

  void _showAddCategorySheet({
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
                    S.of(context).select_category,
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
                          title: Text(
                            getCategoryDisplayName(context, category),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
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

class MaterialShop {
  final String name;
  final String type;
  final String description;
  final String address;
  final String image;
  final double rating;
  final int reviewCount;
  final String category;
  final bool isFeatured;
  final List<ShopProduct> products;

  MaterialShop({
    required this.name,
    required this.type,
    required this.description,
    required this.address,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.isFeatured,
    required this.products,
  });
}

class ShopProduct {
  final String name;
  final String price;
  final String image;

  ShopProduct(this.name, this.price, this.image);
}

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit() : super(false);

  void toggleFavorite() {
    emit(!state);
  }
}