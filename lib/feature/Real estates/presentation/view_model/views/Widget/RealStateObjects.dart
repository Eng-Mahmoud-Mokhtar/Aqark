class RealStateObjects {
  final List<String> images;
  final String name;
  final String type;
  final String location;
  final String address;
  final int baths;
  final int beds;
  final int size;
  final String price;
  final String finishingType;
  final String description;
  final String listingDate;
  final String ownerNumber;
  final String deliveryType;
  final String PaymentDetails;
  final bool isForRent;

  bool isFavorite;
  RealStateObjects({
    required this.images,
    required this.name,
    required this.type,
    required this.location,
    required this.address,
    required this.baths,
    required this.beds,
    required this.size,
    required this.price,
    required this.description,
    required this.finishingType,
    required this.listingDate,
    required this.ownerNumber,
    required this.deliveryType,
    required this.PaymentDetails,
    required this.isForRent,
    this.isFavorite = false,
  });
}
