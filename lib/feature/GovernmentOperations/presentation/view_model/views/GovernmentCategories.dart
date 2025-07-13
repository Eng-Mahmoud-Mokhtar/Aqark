import 'package:bk/feature/GovernmentOperations/presentation/view_model/views/widgets/GovernmentDetails.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/Widgets/buildCategoryItem.dart';

class GovernmentCategories extends StatelessWidget {
  const GovernmentCategories({super.key});

  static const List<Map<String, dynamic>> sections = [
    {
      'titleKey': 'realEstateFinancingTitle',
      'subSections': [
        {
          'titleKey': 'housingAndDevelopmentBankTitle',
          'descriptionKey': 'housingAndDevelopmentBankDescription',
          'imagePath': 'Assets/86-863647_housing-development-bank-لوجو-بنك-التعمير-والاسكان-removebg-preview.png',
          'type': 'bank',
          'website': 'https://www.hdb-egy.com',
        },
        {
          'titleKey': 'egyptianRealEstateBankTitle',
          'descriptionKey': 'egyptianRealEstateBankDescription',
          'imagePath': 'Assets/البنك_العقاري_المصري_العربي_1_-removebg-preview.png',
          'type': 'bank',
          'website': 'https://www.eraa.com.eg',
        },
        {
          'titleKey': 'cibBankTitle',
          'descriptionKey': 'cibBankDescription',
          'imagePath': 'Assets/pngegg.png',
          'type': 'bank',
          'website': 'https://www.cibeg.com',
        },
        {
          'titleKey': 'bankOfAlexandriaTitle',
          'descriptionKey': 'bankOfAlexandriaDescription',
          'imagePath': 'Assets/alex.jpg',
          'type': 'bank',
          'website': 'https://www.alexbank.com',
        },
        {
          'titleKey': 'faisalIslamicBankTitle',
          'descriptionKey': 'faisalIslamicBankDescription',
          'imagePath': 'Assets/19851-web.png',
          'type': 'bank',
          'website': 'https://www.faisalbank.com.eg',
        },
      ],
    },
    {
      'titleKey': 'licensesTitle',
      'subSections': [
        {
          'titleKey': 'buildingLicensesTitle',
          'descriptionKey': 'buildingLicensesDescription',
          'imagePath': 'Assets/icons8-building-insurance-50.png',
          'type': 'license',
          'website': 'https://www.egypt.gov.eg',
        },
        {
          'titleKey': 'operatingLicensesTitle',
          'descriptionKey': 'operatingLicensesDescription',
          'imagePath': 'Assets/icons8-paycheque-48.png',
          'type': 'license',
          'website': 'https://www.egypt.gov.eg',
        },
      ],
    },
    {
      'titleKey': 'realEstateTaxesTitle',
      'subSections': [
        {
          'titleKey': 'valueAddedTaxTitle',
          'descriptionKey': 'valueAddedTaxDescription',
          'imagePath': 'Assets/icons8-add-properties-64.png',
          'type': 'tax',
          'website': 'https://eta.gov.eg',
        },
        {
          'titleKey': 'propertyTaxTitle',
          'descriptionKey': 'propertyTaxDescription',
          'imagePath': 'Assets/icons8-rent-48.png',
          'type': 'tax',
          'website': 'https://eta.gov.eg',
        },
      ],
    },
    {
      'titleKey': 'realEstateReconciliationsTitle',
      'subSections': [
        {
          'titleKey': 'propertyDisputeResolutionTitle',
          'descriptionKey': 'propertyDisputeResolutionDescription',
          'imagePath': 'Assets/icons8-building-50.png',
          'type': 'reconciliation',
          'website': 'https://www.egypt.gov.eg',
        },
        {
          'titleKey': 'buildingViolationReconciliationTitle',
          'descriptionKey': 'buildingViolationReconciliationDescription',
          'imagePath': 'Assets/icons8-flatiron-building-64.png',
          'type': 'reconciliation',
          'website': 'https://www.egypt.gov.eg',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.04;
    double spacing = screenWidth * 0.04;
    double containerWidth = (screenWidth - (padding * 2 + spacing)) / 2;
    double iconSize = containerWidth * 0.35;
    double fontSize = screenWidth * 0.03;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Government_Services,
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: sections.map((section) {
            return buildCategoryItem(
              context: context,
              label: getLocalizedString(context, section['titleKey'] as String),
              onTap: () {
                _navigateTo(
                  context,
                  GovernmentDetails(
                    titleKey: section['titleKey'] as String,
                    subSections: List<Map<String, dynamic>>.from(section['subSections']),
                  ),
                );
              },
              width: containerWidth,
              iconSize: iconSize,
              fontSize: fontSize,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  String getLocalizedString(BuildContext context, String key) {
    switch (key) {
      case 'realEstateFinancingTitle':
        return S.of(context).realEstateFinancingTitle;
      case 'housingAndDevelopmentBankTitle':
        return S.of(context).housingAndDevelopmentBankTitle;
      case 'housingAndDevelopmentBankDescription':
        return S.of(context).housingAndDevelopmentBankDescription;
      case 'egyptianRealEstateBankTitle':
        return S.of(context).egyptianRealEstateBankTitle;
      case 'egyptianRealEstateBankDescription':
        return S.of(context).egyptianRealEstateBankDescription;
      case 'cibBankTitle':
        return S.of(context).cibBankTitle;
      case 'cibBankDescription':
        return S.of(context).cibBankDescription;
      case 'bankOfAlexandriaTitle':
        return S.of(context).bankOfAlexandriaTitle;
      case 'bankOfAlexandriaDescription':
        return S.of(context).bankOfAlexandriaDescription;
      case 'faisalIslamicBankTitle':
        return S.of(context).faisalIslamicBankTitle;
      case 'faisalIslamicBankDescription':
        return S.of(context).faisalIslamicBankDescription;
      case 'licensesTitle':
        return S.of(context).licensesTitle;
      case 'buildingLicensesTitle':
        return S.of(context).buildingLicensesTitle;
      case 'buildingLicensesDescription':
        return S.of(context).buildingLicensesDescription;
      case 'operatingLicensesTitle':
        return S.of(context).operatingLicensesTitle;
      case 'operatingLicensesDescription':
        return S.of(context).operatingLicensesDescription;
      case 'realEstateTaxesTitle':
        return S.of(context).realEstateTaxesTitle;
      case 'valueAddedTaxTitle':
        return S.of(context).valueAddedTaxTitle;
      case 'valueAddedTaxDescription':
        return S.of(context).valueAddedTaxDescription;
      case 'propertyTaxTitle':
        return S.of(context).propertyTaxTitle;
      case 'propertyTaxDescription':
        return S.of(context).propertyTaxDescription;
      case 'realEstateReconciliationsTitle':
        return S.of(context).realEstateReconciliationsTitle;
      case 'propertyDisputeResolutionTitle':
        return S.of(context).propertyDisputeResolutionTitle;
      case 'propertyDisputeResolutionDescription':
        return S.of(context).propertyDisputeResolutionDescription;
      case 'buildingViolationReconciliationTitle':
        return S.of(context).buildingViolationReconciliationTitle;
      case 'buildingViolationReconciliationDescription':
        return S.of(context).buildingViolationReconciliationDescription;
      default:
        return key;
    }
  }
}
