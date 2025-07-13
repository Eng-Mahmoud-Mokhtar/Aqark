import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/utiles/AppBar.dart';
import '../../../../../../core/utiles/constans.dart';
import '../GovernmentCategories.dart';

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
        title: GovernmentCategories().getLocalizedString(context, titleKey),
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(screenWidth * 0.04),
        itemCount: subSections.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: screenWidth * 0.04),
          child: _buildSubSectionContainer(subSections[index], context),
        ),
      ),
    );
  }

  Widget _buildSubSectionContainer(
      Map<String, dynamic> subSection, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.42;
    final double iconSize = containerWidth * 0.35;
    final innerPadding = screenWidth * 0.04;

    final String? title = subSection['titleKey'] != null
        ? GovernmentCategories()
            .getLocalizedString(context, subSection['titleKey'])
        : subSection['title'];
    final String? description = subSection['descriptionKey'] != null
        ? GovernmentCategories()
            .getLocalizedString(context, subSection['descriptionKey'])
        : subSection['description'];
    final String? imagePath = subSection['imagePath'] ?? subSection['image'];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SubSectionDetailsPage(
              titleKey: subSection['titleKey'] as String,
              descriptionKey: subSection['descriptionKey'] as String,
              imagePath: imagePath ?? '',
              type: subSection['type'] as String,
              website: subSection['website'] as String,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(innerPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              decoration: const BoxDecoration(
                color: KprimaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  imagePath ?? '',
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.011),
                  Text(
                    description ?? '',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey[600],
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

class SubSectionDetailsPage extends StatelessWidget {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String type;
  final String website;

  const SubSectionDetailsPage({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    required this.type,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.black, size: screenHeight * 0.025),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            GovernmentCategories().getLocalizedString(context, titleKey),
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            indicatorColor: KprimaryColor,
            labelColor: KprimaryColor,
            unselectedLabelColor: SubText,
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: type == 'bank' ? "Bank Services" : "Legal Details"),
              const Tab(text: "By Application"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDetailsTab(context, type, screenWidth),
            _BankApplicationForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsTab(
      BuildContext context, String type, double screenWidth) {
    switch (type) {
      case 'bank':
        return _buildBankDetailsTab(context, screenWidth);
      case 'license':
        return _buildLicenseDetailsTab(context, screenWidth);
      case 'tax':
        return _buildTaxDetailsTab(context, screenWidth);
      case 'reconciliation':
        return _buildReconciliationDetailsTab(context, screenWidth);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBankDetailsTab(BuildContext context, double screenWidth) {
    Map<String, String> details;
    switch (titleKey) {
      case 'housingAndDevelopmentBankTitle':
        details = {
          'Mortgage Finance':
              'Offers up to 80% financing for residential properties with repayment up to 20 years.',
          'Affordable Housing':
              'Supports low-income housing projects with subsidized rates starting at 3% annually.',
          'Retail Banking':
              'Current accounts, savings accounts, and certificates with competitive returns.',
          'Digital Services':
              'Mobile app for transfers, bill payments, and loan applications.',
          'Contact': 'Call 19995 or visit any of the 100+ branches nationwide.'
        };
        break;
      case 'egyptianRealEstateBankTitle':
        details = {
          'Property Development Loans':
              'Financing for real estate projects with terms up to 7 years.',
          'Personal Banking':
              'Savings accounts and time deposits with flexible withdrawal options.',
          'SME Financing':
              'Loans for small and medium enterprises with competitive rates.',
          'Online Banking':
              'Access accounts and manage transactions via EALB’s e-banking platform.',
          'Contact': 'Reach out via hotline 19322 or visit www.eraa.com.eg.'
        };
        break;
      case 'cibBankTitle':
        details = {
          'Real Estate Financing':
              'Loans up to EGP 10 million for residential and commercial properties.',
          'Wealth Management':
              'Investment products including mutual funds and treasury bills.',
          'Corporate Banking':
              'Serves over 500 major corporations with tailored financial solutions.',
          'Digital Banking':
              'Award-winning mobile app and internet banking for seamless transactions.',
          'Contact': 'Call 19666 or visit one of 190 branches across Egypt.'
        };
        break;
      case 'bankOfAlexandriaTitle':
        details = {
          'Home Loans':
              'Financing up to 85% of property value with flexible repayment plans.',
          'SME Support':
              'Loans and credit facilities for small and medium businesses.',
          'Savings Products':
              'High-yield savings certificates and accounts for retail clients.',
          'Digital Channels':
              'Online banking and mobile app for 24/7 account management.',
          'Contact': 'Hotline 19033 or visit one of 175 branches.'
        };
        break;
      case 'faisalIslamicBankTitle':
        details = {
          'Sharia-Compliant Financing':
              'Murabaha-based home financing up to EGP 5 million.',
          'Investment Accounts':
              'Profit-sharing accounts compliant with Islamic principles.',
          'SME Islamic Finance':
              'Financing for small businesses with no interest charges.',
          'Mobile Banking':
              'Manage accounts and investments via the Faisal Bank app.',
          'Contact': 'Call 19857 or visit one of 37 branches.'
        };
        break;
      default:
        details = {};
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.02),
          Center(
            child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.06),
          ...details.entries.map((entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                ],
              )),
          SizedBox(height: screenWidth * 0.08),
          Center(
            child: SizedBox(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(website))) {
                    await launchUrl(Uri.parse(website));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Visit Website",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.1),
        ],
      ),
    );
  }

  Widget _buildLicenseDetailsTab(BuildContext context, double screenWidth) {
    final details = titleKey == 'buildingLicensesTitle'
        ? {
            'Requirements':
                'Submit architectural plans, ownership documents, and engineering approvals.',
            'Process':
                'Apply through the local municipality or Egypt e-portal; review takes 30-60 days.',
            'Fees':
                'Varies by area and building type; approximately EGP 1,000-10,000.',
            'Regulations':
                'Must comply with Egyptian Building Code (Law 119/2008).',
            'Contact': 'Local municipality office or Egypt e-portal support.'
          }
        : {
            'Requirements':
                'Business registration, safety compliance certificate, and tax clearance.',
            'Process':
                'Submit application via Egypt e-portal; processing time is 15-30 days.',
            'Fees': 'EGP 500-5,000 based on business type and location.',
            'Regulations': 'Adhere to Commercial Law No. 17/1999.',
            'Contact': 'General Authority for Investment or local governorate.'
          };

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.02),
          Center(
            child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.06),
          ...details.entries.map((entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                ],
              )),
          SizedBox(height: screenWidth * 0.08),
          Center(
            child: SizedBox(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(website))) {
                    await launchUrl(Uri.parse(website));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Visit Website",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.1),
        ],
      ),
    );
  }

  Widget _buildTaxDetailsTab(BuildContext context, double screenWidth) {
    final details = titleKey == 'valueAddedTaxTitle'
        ? {
            'Overview':
                'VAT applies to real estate transactions at 14% as per Law No. 67/2016.',
            'Filing Process':
                'Submit quarterly returns via Egyptian Tax Authority portal.',
            'Exemptions':
                'Residential properties for personal use may be exempt.',
            'Penalties': 'Late filing incurs 1% monthly penalty on unpaid tax.',
            'Contact': 'Egyptian Tax Authority helpline or online portal.'
          }
        : {
            'Overview':
                'Annual tax on property value, typically 0.1%-0.2% of assessed value.',
            'Filing Process':
                'File annually by December 31 via Tax Authority or e-portal.',
            'Exemptions': 'Properties under EGP 2 million may be exempt.',
            'Penalties': 'Fines up to EGP 2,000 for non-compliance.',
            'Contact': 'Local tax office or Egyptian Tax Authority portal.'
          };

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.02),
          Center(
            child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.06),
          ...details.entries.map((entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                ],
              )),
          SizedBox(height: screenWidth * 0.08),
          Center(
            child: SizedBox(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(website))) {
                    await launchUrl(Uri.parse(website));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Visit Website",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.1),
        ],
      ),
    );
  }

  Widget _buildReconciliationDetailsTab(
      BuildContext context, double screenWidth) {
    final details = titleKey == 'propertyDisputeResolutionTitle'
        ? {
            'Process':
                'Mediation or arbitration through local courts or reconciliation committees.',
            'Requirements':
                'Property deeds, dispute details, and identification documents.',
            'Timeline':
                'Resolution typically takes 3-6 months depending on case complexity.',
            'Costs': 'Fees range from EGP 500-5,000 based on dispute value.',
            'Authority':
                'Ministry of Justice or local governorate reconciliation office.'
          }
        : {
            'Process':
                'Submit violation details and pay fines via e-portal or local authority.',
            'Requirements':
                'Building plans, ownership proof, and violation report.',
            'Timeline':
                'Processing takes 1-3 months; urgent cases may be expedited.',
            'Costs': 'Fines vary by violation severity, starting at EGP 1,000.',
            'Authority': 'Local municipality or Urban Planning Authority.'
          };

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.02),
          Center(
            child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KprimaryColor,
              ),
              padding: EdgeInsets.all(screenWidth * 0.01),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.06),
          ...details.entries.map((entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: SubText,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                ],
              )),
          SizedBox(height: screenWidth * 0.08),
          Center(
            child: SizedBox(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(website))) {
                    await launchUrl(Uri.parse(website));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Visit Website",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.1),
        ],
      ),
    );
  }
}

class _BankApplicationForm extends StatefulWidget {
  @override
  _BankApplicationFormState createState() => _BankApplicationFormState();
}

class _BankApplicationFormState extends State<_BankApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedFileName;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.name != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Request submitted successfully',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: KprimaryColor,
          duration: const Duration(seconds: 3),
        ),
      );
      _resetForm();
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _phoneController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedFileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                hint: 'Enter your name',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenWidth * 0.03),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hint: 'phone number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Invalid phone number';
                  }
                  return null;
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenWidth * 0.03),
              _buildTextField(
                controller: _descriptionController,
                label: 'Description',
                hint: 'Write Description',
                maxLines: 5,
                minLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenWidth * 0.05),
              _buildFilePickerField(screenWidth),
              SizedBox(height: screenWidth * 0.05),
              _buildButtons(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? icon,
    String? imagePath,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int maxLines = 1,
    int? minLines,
    required double screenWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: KprimaryColor,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        FormField<String>(
          validator: validator,
          builder: (formFieldState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: formFieldState.hasError
                          ? Colors.red[700]!
                          : const Color(0xffE9E9E9),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    maxLines: maxLines,
                    minLines: minLines,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                      prefixIcon: imagePath != null
                          ? Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Image.asset(
                                imagePath,
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.05,
                                color: KprimaryColor,
                              ),
                            )
                          : icon != null
                              ? Icon(icon,
                                  color: KprimaryColor,
                                  size: screenWidth * 0.05)
                              : null,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.04,
                        horizontal: screenWidth * 0.03,
                      ),
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorStyle: TextStyle(height: 0),
                    ),
                    onChanged: (value) {
                      if (formFieldState.hasError) {
                        formFieldState.didChange(value);
                      }
                    },
                  ),
                ),
                if (formFieldState.hasError)
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenWidth * 0.01,
                      left: screenWidth * 0.02,
                    ),
                    child: Text(
                      formFieldState.errorText!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildFilePickerField(double screenWidth) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, screenWidth * 0.12),
        backgroundColor: Colors.red[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      onPressed: _pickFile,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.upload_file,
              color: Colors.white,
              size: screenWidth * 0.05,
            ),
            SizedBox(width: screenWidth * 0.03),
            Flexible(
              child: Text(
                _selectedFileName ?? 'Upload File',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(double screenWidth) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, screenWidth * 0.12),
              backgroundColor: KprimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
            ),
            onPressed: _submitForm,
            child: Text(
              'Submit Request',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, screenWidth * 0.12),
              backgroundColor: Colors.white,
              side: BorderSide(color: KprimaryColor, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
            ),
            onPressed: _resetForm,
            child: Text(
              'Reset',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: KprimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
