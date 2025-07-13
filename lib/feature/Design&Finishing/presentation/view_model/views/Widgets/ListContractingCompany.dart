import 'ContractinyObjects.dart';

final List<ContractingCompany> companies = [
  ContractingCompany(
    name: 'Elite Constructions',
    phone: "+20 106 321 6789",
    address: 'Nasr City, Cairo',
    image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    category: 'Modern',
    isFeatured: true,
    experience: 15,
    features: [
      'High-Quality Materials',
      'Advanced Engineering',
      'Timely Delivery',
      'Safety Compliance',
    ],
    process: [
      {
        'step': '1',
        'title': 'Consultation',
        'desc': 'Understand client needs'
      },
      {'step': '2', 'title': 'Planning', 'desc': 'Create detailed plans'},
      {'step': '3', 'title': 'Execution', 'desc': 'Implement the project'},
    ],
    portfolio: [
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    ],
  ),
  ContractingCompany(
    name: 'Classic Builders',
    phone: "+20 106 321 6789",
    address: 'Zamalek, Cairo',
    image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    category: 'Classic',
    isFeatured: true,
    experience: 20,
    features: [
      'Durable Structures',
      'Traditional Techniques',
      'Eco-Friendly Materials',
      'Expert Craftsmanship',
    ],
    process: [
      {
        'step': '1',
        'title': 'Discovery',
        'desc': 'Explore client requirements'
      },
      {'step': '2', 'title': 'Design', 'desc': 'Develop construction plans'},
      {
        'step': '3',
        'title': 'Construction',
        'desc': 'Execute with precision'
      },
    ],
    portfolio: [
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    ],
  ),
  ContractingCompany(
    name: 'Minimalist Structures',
    phone: "+20 106 321 6789",
    address: '6th October City, Giza',
    image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    category: 'Minimalist',
    isFeatured: true,
    experience: 10,
    features: [
      'Clean Designs',
      'Energy Efficiency',
      'Open Layouts',
      'Smart Construction',
    ],
    process: [
      {'step': '1', 'title': 'Assessment', 'desc': 'Evaluate project needs'},
      {'step': '2', 'title': 'Concept', 'desc': 'Propose modern designs'},
      {'step': '3', 'title': 'Completion', 'desc': 'Finalize the build'},
    ],
    portfolio: [
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    ],
  ),
  ContractingCompany(
    name: 'Industrial Builders',
    phone: "+20 106 321 6789",
    address: 'Mohandessin, Giza',
    image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    category: 'Industrial',
    isFeatured: false,
    experience: 12,
    features: [
      'Rugged Materials',
      'Large-Scale Projects',
      'Heavy-Duty Structures',
      'Industrial Safety',
    ],
    process: [
      {'step': '1', 'title': 'Site Analysis', 'desc': 'Inspect the site'},
      {'step': '2', 'title': 'Drafting', 'desc': 'Create industrial plans'},
      {'step': '3', 'title': 'Build', 'desc': 'Construct the project'},
    ],
    portfolio: [
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    ],
  ),
  ContractingCompany(
    name: 'Eco Constructions',
    phone: "+20 106 321 6789",
    address: 'Heliopolis, Cairo',
    image: 'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    category: 'Sustainable',
    isFeatured: true,
    experience: 8,
    features: [
      'Sustainable Materials',
      'Energy Efficiency',
      'Eco Designs',
      'Green Certifications',
    ],
    process: [
      {'step': '1', 'title': 'Meeting', 'desc': 'Discuss project vision'},
      {'step': '2', 'title': 'Design', 'desc': 'Craft sustainable plans'},
      {'step': '3', 'title': 'Setup', 'desc': 'Install eco elements'},
    ],
    portfolio: [
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
      'Assets/ce7f31c1-49f4-4a53-82c2-7ff1572f73b2.jpeg',
    ],
  ),
];
