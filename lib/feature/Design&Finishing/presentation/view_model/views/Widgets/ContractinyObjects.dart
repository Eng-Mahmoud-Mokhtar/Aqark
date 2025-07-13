class ContractingCompany {
  final String name;
  final String phone;
  final String address;
  final String image;
  final String category;
  final bool isFeatured;
  final List<String> features;
  final List<Map<String, String>> process;
  final List<String> portfolio;
  final int experience;

  ContractingCompany({
    required this.name,
    required this.phone,
    required this.address,
    required this.image,
    required this.category,
    required this.isFeatured,
    required this.features,
    required this.process,
    required this.portfolio,
    required this.experience,
  });

  Map<String, dynamic> toDetailsMap() => {
    'features': features,
    'process': process,
    'portfolio': portfolio,
    'image': image,
    'experience': experience,
  };
}