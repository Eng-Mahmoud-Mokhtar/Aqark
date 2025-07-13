import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'Widgets/MaterialShopObjects.dart';

class ShopDetailsScreen extends StatefulWidget {
  final MaterialShop shop;

  const ShopDetailsScreen({Key? key, required this.shop}) : super(key: key);

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
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

  // Helper method to get localized shop type name
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

  Widget _buildProductsTab() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12, // Reduced spacing for smaller cards
        mainAxisSpacing: 12,
        childAspectRatio: 0.85, // Increased to make cards more compact
      ),
      itemCount: widget.shop.products.length,
      itemBuilder: (context, index) {
        final product = widget.shop.products[index];
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(10), // Slightly smaller radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1.5, // Slightly reduced shadow
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height:
                      constraints.maxWidth * 0.7, // Reduced image height
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: constraints.maxWidth * 0.7,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        constraints.maxWidth * 0.05), // Reduced padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize:
                            constraints.maxWidth * 0.07, // Smaller font
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                            height:
                            constraints.maxWidth * 0.03), // Reduced spacing
                        Text(
                          product.price,
                          style: TextStyle(
                            fontSize:
                            constraints.maxWidth * 0.06, // Smaller font
                            fontWeight: FontWeight.w600,
                            color: SecondaryColor,
                          ),
                        ),
                      ],
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: widget.shop.name,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),
            CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundImage: AssetImage(widget.shop.image),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              widget.shop.name,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
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
                  Row(
                    children: [
                      Icon(Icons.work_outline, size: screenWidth * 0.04),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        getCategoryDisplayName(context, widget.shop.type),
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
                        widget.shop.address,
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
                      Icon(
                        Icons.phone_outlined,
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      GestureDetector(
                        onTap: () {
                          // Add phone tap functionality if needed
                        },
                        child: Text(
                          widget.shop.phone,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: KprimaryColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Products,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildProductsTab(),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.15),
          ],
        ),
      ),
    );
  }
}
