import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/ListGovernoratesWithCities.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'ShopDetails.dart';
import 'Widgets/MaterialShopObjects.dart';
import 'Widgets/ShopProductObjects.dart';
class Materials extends StatefulWidget {
  final String sectionType;

  const Materials({Key? key, required this.sectionType}) : super(key: key);

  @override
  _MaterialsScreenState createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<Materials> {
  String searchQuery = '';
  String selectedCategory = 'All';
  String? _selectedGovernorate;
  String? _selectedCity;

  List<String> get categories {
    switch (widget.sectionType) {
      case 'ConstructionMaterials':
        return [
          'All',
          'Cement',
          'Bricks',
          'Steel',
          'Plumbing',
          'Electrical',
          'Sand',
          'Gravel',
          'Concrete',
          'Timber',
          'Glass',
        ];
      case 'FinishingMaterials':
        return [
          'All',
          'Paints',
          'Tiles',
          'Wallpaper',
          'Flooring',
          'Gypsum',
          'Marble',
        ];
      case 'FurnitureMaterials':
        return [
          'All',
          'Furniture',
          'Sofas',
          'Tables',
          'Beds',
          'Cabinets',
        ];
      case 'EquipmentMaterials':
        return [
          'All',
          'Equipment',
          'Drills',
          'Mixers',
          'Scaffolding',
          'Cranes',
        ];
      default:
        return ['All'];
    }
  }

  final List<MaterialShop> shops = [
    MaterialShop(
      name: 'El-Madina Cement',
      type: 'Cement',
      phone: "+20 106 321 6789",
      description: 'Specialized in all types of construction cement',
      address: 'Nasr City, Cairo',
      image: 'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg',
      category: 'Cement',
      isFeatured: true,
      sectionType: 'ConstructionMaterials',
      products: [
        ShopProduct('Portland Cement', '50 EGP/bag', 'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg'),
        ShopProduct('White Cement', '75 EGP/bag', 'Assets/construction-technicians-are-mixing-cement-stone-sand-construction.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Sanitary Hub',
      type: 'Plumbing',
      phone: "+20 106 321 6789",
      description: 'Specialized in all types of plumbing materials and accessories',
      address: 'Nasr City, Cairo',
      image: 'Assets/side-view-man-working-as-plumber.jpg',
      category: 'Plumbing',
      isFeatured: true,
      sectionType: 'ConstructionMaterials',
      products: [
        ShopProduct('PPR Pipe 1 inch', '90 EGP/meter', 'Assets/side-view-man-working-as-plumber.jpg'),
        ShopProduct('Brass Basin Mixer', '450 EGP', 'Assets/side-view-man-working-as-plumber.jpg'),
        ShopProduct('Stainless Steel Floor Drain', '120 EGP', 'Assets/side-view-man-working-as-plumber.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Egypt Bricks / طوب مصر',
      type: 'Bricks',
      phone: "+20 106 321 6789",
      description: 'High quality red and white bricks',
      address: '6th October City',
      image: 'Assets/brick-piles-placed-factory-floor.jpg',
      category: 'Bricks',
      isFeatured: true,
      sectionType: 'ConstructionMaterials',
      products: [
        ShopProduct('Red Clay Bricks', '1.2 EGP/brick', 'Assets/brick-piles-placed-factory-floor.jpg'),
        ShopProduct('White Bricks', '1.5 EGP/brick', 'Assets/brick-piles-placed-factory-floor.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Ezz Steel / حديد عز',
      type: 'Steel',
      phone: "+20 106 321 6789",
      description: 'Construction steel of all diameters',
      address: 'Downtown, Cairo',
      image: 'Assets/arc-welding-steel-construction-site.jpg',
      category: 'Steel',
      isFeatured: true,
      sectionType: 'ConstructionMaterials',
      products: [
        ShopProduct('8mm Rebar', '15,000 EGP/ton', 'Assets/arc-welding-steel-construction-site.jpg'),
        ShopProduct('12mm Rebar', '16,000 EGP/ton', 'Assets/arc-welding-steel-construction-site.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Electro World',
      type: 'Electrical',
      phone: "+20 106 321 6789",
      description: 'High-quality electrical supplies for homes and businesses',
      address: 'El-Matarya, Cairo',
      image: 'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg',
      category: 'Electrical',
      isFeatured: true,
      sectionType: 'ConstructionMaterials',
      products: [
        ShopProduct('LED Ceiling Light', '120 EGP/pc', 'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
        ShopProduct('Electrical Cable 100m', '950 EGP/roll', 'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
        ShopProduct('Wall Switch Set', '200 EGP/set', 'Assets/man-electrical-technician-working-switchboard-with-fuses.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Jotun Paints / جوتن للدهانات',
      type: 'Paints',
      phone: "+20 106 321 6789",
      description: 'Premium interior and exterior paints',
      address: 'Heliopolis, Cairo',
      image: 'Assets/top-view-paint-can.jpg',
      category: 'Paints',
      isFeatured: true,
      sectionType: 'FinishingMaterials',
      products: [
        ShopProduct('Jotun Majesty', '650 EGP/gallon', 'Assets/top-view-paint-can.jpg'),
        ShopProduct('Jotun Weatherguard', '700 EGP/gallon', 'Assets/top-view-paint-can.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Cleopatra Tiles / كليوباترا للسيراميك',
      type: 'Tiles',
      phone: "+20 106 321 6789",
      description: 'Ceramic and porcelain tiles',
      address: 'Mohandessin, Giza',
      image: 'Assets/still-life-putting-up-decorative-vinyls.jpg',
      category: 'Tiles',
      isFeatured: true,
      sectionType: 'FinishingMaterials',
      products: [
        ShopProduct('60x60cm Ceramic', '120 EGP/m2', 'Assets/still-life-putting-up-decorative-vinyls.jpg'),
        ShopProduct('80x80cm Porcelain', '180 EGP/m2', 'Assets/still-life-putting-up-decorative-vinyls.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Modern Furniture',
      type: 'Furniture',
      phone: "+20 106 321 6789",
      description: 'High-quality modern furniture for homes',
      address: 'Maadi, Cairo',
      image: 'Assets/3d-rendering-luxury-business-meeting-working-room-executive-office.jpg',
      category: 'Furniture',
      isFeatured: true,
      sectionType: 'FurnitureMaterials',
      products: [
        ShopProduct('Sofa Set', '15,000 EGP', 'Assets/furniture.jpg'),
        ShopProduct('Dining Table', '8,000 EGP', 'Assets/furniture.jpg'),
      ],
    ),
    MaterialShop(
      name: 'Construction Equipment',
      type: 'Equipment',
      phone: "+20 106 321 6789",
      description: 'Heavy-duty construction equipment',
      address: 'New Cairo, Cairo',
      image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      category: 'Equipment',
      isFeatured: true,
      sectionType: 'EquipmentMaterials',
      products: [
        ShopProduct('Concrete Mixer', '25,000 EGP', 'Assets/equipment.jpg'),
        ShopProduct('Power Drill', '1,500 EGP', 'Assets/equipment.jpg'),
      ],
    ),
  ];

  List<MaterialShop> get filteredShops {
    return shops.where((shop) {
      final matchesSearch =
          shop.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              shop.type.toLowerCase().contains(searchQuery.toLowerCase()) ||
              shop.address.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          selectedCategory == 'All' || shop.category == selectedCategory;
      final matchesSectionType = shop.sectionType == widget.sectionType;
      final matchesLocation = _selectedCity == null ||
          shop.address.contains(_selectedCity!) &&
              (_selectedGovernorate == null || shop.address.contains(_selectedGovernorate!));
      return matchesSearch && matchesCategory && matchesSectionType && matchesLocation;
    }).toList();
  }

  List<MaterialShop> get featuredShops {
    return shops
        .where((shop) => shop.isFeatured && shop.sectionType == widget.sectionType)
        .toList();
  }

  List<MaterialShop> get shopsByCategory {
    if (selectedCategory == 'All') return filteredShops;
    return filteredShops
        .where((shop) => shop.category == selectedCategory)
        .toList();
  }

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
      case 'Plumbing':
        return S.of(context).Plumbing;
      case 'Electrical':
        return S.of(context).Electrical;
      case 'Paints':
        return S.of(context).Paints;
      case 'Tiles':
        return S.of(context).Tiles;
      default:
        return category;
    }
  }

  String getLocalizedString(BuildContext context, String key) {
    final s = S.of(context);
    switch (key) {
      case "ConstructionMaterials":
        return s.ConstructionMaterials;
      case "FinishingMaterials":
        return s.FinishingMaterials;
      case "FurnitureMaterials":
        return s.FurnitureMaterials;
      case "EquipmentMaterials":
        return s.EquipmentMaterials;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print('Categories for ${widget.sectionType}: ${categories.join(', ')}');

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: getLocalizedString(context, widget.sectionType),
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
                color: isSelected ? KprimaryColor : KprimaryColor.withOpacity(0.1),
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
          height: MediaQuery.of(context).size.width * 0.45,
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

  Widget _buildFeaturedShopContainer(MaterialShop shop) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return GestureDetector(
      onTap: () => _showShopDetails(shop),
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
                      backgroundImage: AssetImage(shop.image),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      shop.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
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
                      fontSize: screenWidth * 0.03,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
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
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: screenWidth * 0.045,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
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
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              height: screenHeight * 0.37,
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
                                Icon(Icons.add,
                                    color: KprimaryColor, size: screenWidth * 0.05),
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
                          },
                          child: Text(
                            "${S.of(context).Show} ${filteredShops.length}",
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
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.white;
                              },
                            ),
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return KprimaryColor.withOpacity(0.3);
                                }
                                return KprimaryColor;
                              },
                            ),
                            side: MaterialStateProperty.resolveWith<BorderSide>(
                                  (states) {
                                return BorderSide(
                                  color: (states.contains(MaterialState.disabled))
                                      ? KprimaryColor.withOpacity(0.3)
                                      : KprimaryColor,
                                  width: 1,
                                );
                              },
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
        );
      },
    );
  }
}



