import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bk/core/utiles/constans.dart';
import 'package:bk/core/utiles/AppBar.dart';
import 'package:bk/generated/l10n.dart';

import '../../../../login/presentation/view_model/views/widgets/phoneNumber.dart';

class PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneNumber({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    void showCountryPicker(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (modalContext) {
          return BlocProvider.value(
            value: context.read<CountryCubit>(),
            child: Builder(
              builder: (modalContext) {
                context.read<CountryCubit>().resetFilter();
                final screenHeight = MediaQuery.of(modalContext).size.height;
                return FractionallySizedBox(
                  heightFactor: (screenHeight - 50) / screenHeight,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(modalContext).ChooseCountryCode,
                              style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.close,
                                  size: screenWidth * 0.05, color: Colors.grey),
                              onPressed: () => Navigator.pop(modalContext),
                            ),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        SizedBox(
                          height: screenWidth * 0.12,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0xffFAFAFA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xffE9E9E9)),
                            ),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: S.of(modalContext).SearchForCountries,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.035),
                                prefixIcon: Icon(Icons.search_outlined,
                                    color: Colors.grey, size: screenWidth * 0.05),
                              ),
                              onChanged: (query) =>
                                  modalContext.read<CountryCubit>().filterCountries(query),
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Expanded(
                          child: BlocBuilder<CountryCubit, CountryState>(
                            builder: (context, state) {
                              return state.filteredCountries.isEmpty
                                  ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'Assets/file.png',
                                      width: screenWidth * 0.3,
                                      color: const Color(0xffd8dfea),
                                      errorBuilder: (context, error, stackTrace) =>
                                          Icon(Icons.error, size: screenWidth * 0.3),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      S.of(context).NoResultstoShow,
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                                  : ListView.builder(
                                itemCount: state.filteredCountries.length,
                                itemBuilder: (context, index) {
                                  var country = state.filteredCountries[index];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Text(country['flag']!,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.04)),
                                        const SizedBox(width: 20),
                                        SizedBox(
                                          width: screenWidth * 0.12,
                                          child: Text(
                                            country['code']!,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.03,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            country['name']!,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.03,
                                                fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      context.read<CountryCubit>().selectCountry(country);
                                      Navigator.pop(modalContext);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).phoneNumberLabel,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            return SizedBox(
              height: screenWidth * 0.12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffE9E9E9))),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => showCountryPicker(context),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: Row(
                          children: [
                            Text(state.selectedCountryShort,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold)),
                            Icon(Icons.keyboard_arrow_down,
                                size: screenWidth * 0.05,
                                color: Colors.grey.shade500),
                            Container(
                                height: screenWidth * 0.1,
                                width: 1.0,
                                color: Colors.grey.shade300),
                            SizedBox(width: screenWidth * 0.01)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
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
                          hintText: '1001234567',
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.035),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: validator,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class GovernmentOperations extends StatelessWidget {
  const GovernmentOperations({super.key});

  static const List<Map<String, dynamic>> sections = [
    {
      'titleKey': 'realEstateFinancingTitle',
      'imagePath': 'Assets/price.png',
      'subSections': [
        {
          'titleKey': 'housingAndDevelopmentBankTitle',
          'descriptionKey': 'housingAndDevelopmentBankDescription',
          'imagePath': 'Assets/icons8-bank-approved-64.png',
        },
        {
          'titleKey': 'egyptianRealEstateBankTitle',
          'descriptionKey': 'egyptianRealEstateBankDescription',
          'imagePath': 'Assets/icons8-bank-64.png',
        },
      ],
    },
    {
      'titleKey': 'licensesTitle',
      'imagePath': 'Assets/certificate.png',
      'subSections': [
        {
          'titleKey': 'buildingLicensesTitle',
          'descriptionKey': 'buildingLicensesDescription',
          'imagePath': 'Assets/icons8-building-insurance-50.png',
        },
        {
          'titleKey': 'operatingLicensesTitle',
          'descriptionKey': 'operatingLicensesDescription',
          'imagePath': 'Assets/icons8-paycheque-48.png',
        },
      ],
    },
    {
      'titleKey': 'realEstateTaxesTitle',
      'imagePath': 'Assets/real-estate.png',
      'subSections': [
        {
          'titleKey': 'valueAddedTaxTitle',
          'descriptionKey': 'valueAddedTaxDescription',
          'imagePath': 'Assets/icons8-add-properties-64.png',
        },
        {
          'titleKey': 'propertyTaxTitle',
          'descriptionKey': 'propertyTaxDescription',
          'imagePath': 'Assets/icons8-rent-48.png',
        },
      ],
    },
    {
      'titleKey': 'realEstateRegistrationsTitle',
      'imagePath': 'Assets/building.png',
      'subSections': [
        {
          'titleKey': 'propertyRegistrationTitle',
          'descriptionKey': 'propertyRegistrationDescription',
          'imagePath': 'Assets/icons8-edit-property-32.png',
        },
        {
          'titleKey': 'mortgageRegistrationTitle',
          'descriptionKey': 'mortgageRegistrationDescription',
          'imagePath': 'Assets/icons8-registration-48.png',
        },
      ],
    },
    {
      'titleKey': 'realEstateReconciliationsTitle',
      'imagePath': 'Assets/handshake.png',
      'subSections': [
        {
          'titleKey': 'propertyDisputeResolutionTitle',
          'descriptionKey': 'propertyDisputeResolutionDescription',
          'imagePath': 'Assets/icons8-building-50.png',
        },
        {
          'titleKey': 'buildingViolationReconciliationTitle',
          'descriptionKey': 'buildingViolationReconciliationDescription',
          'imagePath': 'Assets/icons8-flatiron-building-64.png',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Government_Services,
        onBack: () {
          Navigator.pop(context);
        },
        showSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          physics: const ClampingScrollPhysics(),
          children: sections.map((section) {
            return _buildCategoryItem(
              imagePath: section['imagePath'],
              label: _getLocalizedString(context, section['titleKey']),
              onTap: () {
                _navigateTo(
                  context,
                  GovernmentDetails(
                    titleKey: section['titleKey'],
                    subSections: List<Map<String, dynamic>>.from(section['subSections']),
                  ),
                );
              },
              screenWidth: screenWidth,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: KprimaryColor, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              fit: BoxFit.contain,
              color: KprimaryColor,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
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

  String _getLocalizedString(BuildContext context, String key) {
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
      case 'realEstateRegistrationsTitle':
        return S.of(context).realEstateRegistrationsTitle;
      case 'propertyRegistrationTitle':
        return S.of(context).propertyRegistrationTitle;
      case 'propertyRegistrationDescription':
        return S.of(context).propertyRegistrationDescription;
      case 'mortgageRegistrationTitle':
        return S.of(context).mortgageRegistrationTitle;
      case 'mortgageRegistrationDescription':
        return S.of(context).mortgageRegistrationDescription;
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

class GovernmentDetails extends StatelessWidget {
  final String titleKey;
  final List<Map<String, dynamic>> subSections;

  const GovernmentDetails({
    super.key,
    required this.titleKey,
    required this.subSections,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: GovernmentOperations()._getLocalizedString(context, titleKey),
        onBack: () {
          Navigator.pop(context);
        },
        showSearch: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(screenWidth * 0.04),
        physics: const ClampingScrollPhysics(),
        itemCount: subSections.length,
        itemBuilder: (context, index) => _buildSubSectionContainer(subSections[index], context),
      ),
    );
  }

  Widget _buildSubSectionContainer(Map<String, dynamic> subSection, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPage(
              serviceTitleKey: subSection['titleKey'],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: SubText, width: 1),
        ),
        child: Row(
          children: [
            Image.asset(
              subSection['imagePath'],
              width: min(screenWidth * 0.083, 30),
              height: min(screenWidth * 0.083, 30),
              fit: BoxFit.contain,
              color: KprimaryColor,
              colorBlendMode: BlendMode.srcIn,
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    GovernmentOperations()._getLocalizedString(context, subSection['titleKey']),
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.011),
                  Text(
                    GovernmentOperations()._getLocalizedString(context, subSection['descriptionKey']),
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  final String serviceTitleKey;

  const RegistrationPage({super.key, required this.serviceTitleKey});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _detailsController = TextEditingController();
  String? _nameError;
  String? _phoneError;
  String? _detailsError;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _nameError = _nameController.text.isEmpty ? S.of(context).fullNameError : null;
      _phoneError = _phoneController.text.isEmpty
          ? S.of(context).phoneNumberError
          : (!RegExp(r'^\d{10,11}$').hasMatch(_phoneController.text)
          ? S.of(context).phoneNumberInvalidError
          : null);
      _detailsError = _detailsController.text.isEmpty ? S.of(context).requestDetailsError : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final textAlign = isArabic ? TextAlign.right : TextAlign.left;

    return BlocProvider(
      create: (context) => CountryCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: GovernmentOperations()._getLocalizedString(context, widget.serviceTitleKey),
          onBack: () {
            Navigator.pop(context);
          },
          showSearch: false,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).registerRequestFor(
                    GovernmentOperations()._getLocalizedString(context, widget.serviceTitleKey),
                  ),
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: KprimaryColor,
                  ),
                ),
                SizedBox(height: screenWidth * 0.022),
                Text(
                  S.of(context).fillFormPrompt,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: SubText,
                  ),
                ),
                SizedBox(height: screenWidth * 0.06),
                Text(
                  S.of(context).fullNameLabel,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                _buildTextField(
                  controller: _nameController,
                  label: S.of(context).fullNameLabel,
                  icon: Icons.person_outline_sharp,
                ),
                if (_nameError != null)
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.01),
                    child: Text(
                      _nameError!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.red[500],
                      ),
                    ),
                  ),
                SizedBox(height: screenWidth * 0.04),
                PhoneNumber(
                  controller: _phoneController,
                  validator: null, // Validator handled in _validateForm
                ),
                if (_phoneError != null)
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.01),
                    child: Text(
                      _phoneError!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                SizedBox(height: screenWidth * 0.04),
                Text(
                  S.of(context).requestDetailsLabel,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                _buildTextField(
                  controller: _detailsController,
                  label: S.of(context).requestDetailsLabel,
                  icon: null,
                  maxLines: null,
                  minLines: 4,
                ),
                if (_detailsError != null)
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.01),
                    child: Text(
                      _detailsError!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[500],
                      ),
                    ),
                  ),
                SizedBox(height: screenWidth * 0.06),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KprimaryColor,
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      _validateForm();
                      if (_nameError == null && _phoneError == null && _detailsError == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.04),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: screenWidth * 0.02),
                                    Text(
                                      S.of(context).submittedSuccessfullyTitle,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.bold,
                                        color: KprimaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: screenWidth * 0.02),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                      child: Text(
                                        S.of(context).submittedSuccessfullyMessage,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: SubText,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    SizedBox(height: screenWidth * 0.02),
                                    SizedBox(
                                      width: double.infinity,
                                      height: screenWidth * 0.1,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: KprimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                          final section = GovernmentOperations.sections.firstWhere(
                                                (section) => section['subSections'].any(
                                                    (sub) => sub['titleKey'] == widget.serviceTitleKey),
                                          );
                                          Navigator.pushReplacement(
                                            dialogContext,
                                            MaterialPageRoute(
                                              builder: (context) => GovernmentDetails(
                                                titleKey: section['titleKey'],
                                                subSections: section['subSections'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          S.of(context).okButton,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      S.of(context).submitRequestButton,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    TextInputType? keyboardType,
    int? maxLines,
    int? minLines,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffE9E9E9)),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: screenWidth * 0.03,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: label,
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
          prefixIcon: icon != null
              ? Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.01,right: screenWidth * 0.01),
            child: Icon(
              icon,
              color: SubText,
              size: screenWidth * 0.05,
            ),
          )
              : null,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
      ),
    );
  }
}