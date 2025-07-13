import 'ShopProductObjects.dart';

class MaterialShop {
  final String name;
  final String type;
  final String phone;
  final String description;
  final String address;
  final String image;
  final String category;
  final bool isFeatured;
  final String sectionType;
  final List<ShopProduct> products;

  MaterialShop({
    required this.name,
    required this.type,
    required this.phone,
    required this.description,
    required this.address,
    required this.image,
    required this.category,
    required this.isFeatured,
    required this.sectionType,
    required this.products,
  });
}
