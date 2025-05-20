import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'BrokerDetailsPage.dart';

class Broker {
  final String name;
  final String phone;
  final String location;
  final String city;
  final String details;
  final String image;
  final bool isFeatured;

  Broker({
    required this.name,
    required this.phone,
    required this.location,
    required this.city,
    required this.details,
    required this.image,
    required this.isFeatured,
  });
}

class SubscriptionPage extends StatelessWidget {
  final Broker broker;

  const SubscriptionPage({Key? key, required this.broker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: "Subscription",
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image.asset(
                    'Assets/freepik__logo-design-for-a-real-estate-app-featuring-the-le__89841.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                "Choose Your Plan",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title: "Monthly Subscription",
                price: "\$19.99 / month",
                description:
                "Ideal for short-term needs. Get instant access to premium listings, verified brokers, and top property opportunities — with the flexibility to cancel anytime.",
                onSubscribe: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentPage(
                        broker: broker,
                        selectedPlan: "Monthly Subscription - \$19.99 / month",
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title: "Yearly Subscription",
                price: "\$199.99 / year",
                description:
                "Best value! Save over 15% by subscribing yearly. Enjoy uninterrupted access to all premium features, early listings, and exclusive broker deals for a full year.",
                isPopular: true,
                onSubscribe: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentPage(
                        broker: broker,
                        selectedPlan: "Yearly Subscription - \$199.99 / year",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(
      BuildContext context, {
        required String title,
        required String price,
        required String description,
        bool isPopular = false,
        required VoidCallback onSubscribe,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: screenWidth * 0.01),
          padding: EdgeInsets.all(screenWidth * 0.04),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE0E0E0), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenWidth * 0.02),
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                price,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: SecondaryColor,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: SubText,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenWidth * 0.02),
              ElevatedButton(
                onPressed: onSubscribe,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Subscribe Now",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        if (isPopular)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.025,
                vertical: screenWidth * 0.012,
              ),
              decoration: BoxDecoration(
                color: SecondaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Text(
                "Most Popular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PaymentPage extends StatefulWidget {
  final Broker broker;
  final String selectedPlan;

  const PaymentPage({Key? key, required this.broker, required this.selectedPlan}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedMethod;
  bool showCreditCardDetails = false;
  bool showPaypalDetails = false;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      "label": "Credit Card",
      "image": "Assets/Mastercard.png",
    },
    {
      "label": "PayPal",
      "image": "Assets/PayPal.png",
    },
  ];

  final Map<String, FocusNode> _focusNodes = {
    "Card Number": FocusNode(),
    "Cardholder Name": FocusNode(),
    "Expiry Date": FocusNode(),
    "CVV": FocusNode(),
    "PayPal Email": FocusNode(),
    "PayPal Password": FocusNode(),
  };

  @override
  void dispose() {
    _focusNodes.values.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: "Payment method",
        onBack: () => Navigator.pop(context),
        showSearch: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                    color: KprimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image.asset(
                    'Assets/freepik__logo-design-for-a-real-estate-app-featuring-the-le__89841.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                "Choose Payment Method",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Column(
                children: paymentMethods.map((method) {
                  final isSelected = method["label"] == selectedMethod;
                  final isCreditCard = method["label"] == "Credit Card";
                  final isPaypal = method["label"] == "PayPal";
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedMethod = null;
                          showCreditCardDetails = false;
                          showPaypalDetails = false;
                        } else {
                          selectedMethod = method["label"];
                          showCreditCardDetails = isCreditCard;
                          showPaypalDetails = isPaypal;
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? KprimaryColor
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                method["image"]!,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                              ),
                              SizedBox(width: screenWidth * 0.04),
                              Expanded(
                                child: Text(
                                  method["label"]!,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                isSelected
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_right,
                                size: screenWidth * 0.05,
                                color: isSelected
                                    ? KprimaryColor
                                    : Colors.grey,
                              ),
                            ],
                          ),
                          if (isCreditCard && showCreditCardDetails) ...[
                            SizedBox(height: screenWidth * 0.04),
                            Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                            SizedBox(height: screenWidth * 0.03),
                            _creditCardForm(screenWidth),
                          ],
                          if (isPaypal && showPaypalDetails) ...[
                            SizedBox(height: screenWidth * 0.04),
                            Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
                            SizedBox(height: screenWidth * 0.03),
                            _paypalForm(screenWidth),
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: screenWidth * 0.04), // Replaced Spacer
              Center(
                child: ElevatedButton(
                  onPressed: selectedMethod == null
                      ? null
                      : () {
                    _showProcessingDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, screenWidth * 0.12),
                    backgroundColor:
                    selectedMethod == null ? SubText : KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04), // Added bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _creditCardForm(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField("Card Number", screenWidth),
        SizedBox(height: screenWidth * 0.02),
        _buildTextField("Cardholder Name", screenWidth),
        SizedBox(height: screenWidth * 0.02),
        Row(
          children: [
            Expanded(child: _buildTextField("Expiry Date", screenWidth)),
            SizedBox(width: screenWidth * 0.02),
            Expanded(child: _buildTextField("CVV", screenWidth)),
          ],
        ),
      ],
    );
  }

  Widget _paypalForm(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField("PayPal Email", screenWidth, keyboardType: TextInputType.emailAddress),
        SizedBox(height: screenWidth * 0.02),
        _buildTextField("PayPal Password", screenWidth, obscureText: true),
      ],
    );
  }

  Widget _buildTextField(String label, double screenWidth, {TextInputType? keyboardType, bool obscureText = false}) {
    return Focus(
      focusNode: _focusNodes[label],
      child: Builder(
        builder: (context) {
          final isFocused = Focus.of(context).hasFocus;
          return TextField(
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                color: isFocused ? KprimaryColor : Colors.grey,
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenWidth * 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: KprimaryColor, width: 1.5),
              ),
            ),
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: keyboardType ?? (label == "CVV" || label == "Card Number"
                ? TextInputType.number
                : TextInputType.text),
            obscureText: obscureText || label == "CVV",
          );
        },
      ),
    );
  }

  void _showProcessingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ProcessingPaymentDialog(broker: widget.broker);
      },
    );
  }
}

class ProcessingPaymentDialog extends StatefulWidget {
  final Broker broker;

  const ProcessingPaymentDialog({Key? key, required this.broker}) : super(key: key);

  @override
  State<ProcessingPaymentDialog> createState() => _ProcessingPaymentDialogState();
}

class _ProcessingPaymentDialogState extends State<ProcessingPaymentDialog> {
  bool isProcessing = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(screenWidth * 0.04),
      content: SizedBox(
        width: screenWidth,
        height: screenWidth * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcessing) ...[
              Text(
                "Payment Processing",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: KprimaryColor,
                ),
              ),
              SizedBox(height: screenWidth * 0.2),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0c356b)),
              ),
              SizedBox(height: screenWidth * 0.2),
              Text(
                "Please wait while we process money from your bank account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey.shade600),
              ),
            ] else ...[
              Icon(
                Icons.check_circle,
                color: KprimaryColor,
                size: screenWidth * 0.15,
              ),
              const SizedBox(height: 20),
              Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c356b),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                "Your subscription has been placed.\nWe’ll send you an email with your subscription details.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey.shade600),
              ),
              SizedBox(height: screenWidth * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BrokerDetailsPage(
                        broker: {
                          "name": widget.broker.name,
                          "phone": widget.broker.phone,
                          "location": widget.broker.location,
                          "city": widget.broker.city,
                          "details": widget.broker.details,
                          "image": widget.broker.image,
                          "isFeatured": widget.broker.isFeatured,
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                  backgroundColor: KprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


class BrokersScreen extends StatefulWidget {
  const BrokersScreen({Key? key}) : super(key: key);

  @override
  _BrokersScreenState createState() => _BrokersScreenState();
}

class _BrokersScreenState extends State<BrokersScreen> {
  String searchQuery = '';
  String? _selectedGovernorate;
  String? _selectedCity;

  List<Broker> get filteredBrokers {
    return brokers.where((broker) {
      final matchesSearch = broker.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          broker.location.toLowerCase().contains(searchQuery.toLowerCase()) ||
          broker.city.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesLocation = _selectedGovernorate == null || broker.location == _selectedGovernorate;
      final matchesCity = _selectedCity == null || broker.city == _selectedCity;

      return matchesSearch && matchesLocation && matchesCity;
    }).toList();
  }

  List<Broker> get featuredBrokers {
    return brokers.where((broker) => broker.isFeatured).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: S.of(context).Brokers,
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
              _buildFeaturedSection(),
              const SizedBox(height: 16),
              _buildAllBrokersSection(),
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
                color: backgroundColor,
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
                  hintText: S.of(context).SearchForBrokers,
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.035,
                    horizontal: screenWidth * 0.01,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
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
                color: backgroundColor,
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

  Widget _buildFeaturedSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final featured = featuredBrokers;
    if (featured.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interested',
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
              return _buildFeaturedBrokerContainer(featured[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedBrokerContainer(Broker broker) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return GestureDetector(
      onTap: () => _navigateToSubscription(broker),
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
                      backgroundImage: AssetImage(broker.image),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      broker.name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: screenWidth * 0.04, color: SecondaryColor),
                        SizedBox(width: screenWidth * 0.01),
                        Flexible(
                          child: Text(
                            "${broker.city}, ${broker.location}",
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
                    'Premium',
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

  Widget _buildAllBrokersSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final brokersList = filteredBrokers;
    if (brokersList.isEmpty) {
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
            S.of(context).NoBrokersAvailable,
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
          S.of(context).Brokers,
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
          itemCount: brokersList.length,
          itemBuilder: (context, index) {
            return _buildBrokerContainer(brokersList[index]);
          },
        ),
      ],
    );
  }

  Widget _buildBrokerContainer(Broker broker) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
        onTap: () => _showBrokerDetails(broker),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              backgroundImage: AssetImage(broker.image),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    broker.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: screenWidth * 0.04, color: SecondaryColor),
                      SizedBox(width: screenWidth * 0.001),
                      Text(
                        "${broker.city}, ${broker.location}",
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
  void _showBrokerDetails(Broker broker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrokerDetailsPage(
          broker: {
            "name": broker.name,
            "phone": broker.phone,
            "location": broker.location,
            "city": broker.city,
            "details": broker.details,
            "image": broker.image,
            "isFeatured": broker.isFeatured,
          },
        ),
      ),
    );
  }

  void _navigateToSubscription(Broker broker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionPage(broker: broker),
      ),
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
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.all(screenWidth * 0.04),
              height: screenHeight * 0.36,
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
                              setModalState(() {
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
                            setState(() {});
                          },
                          child: Text(
                            "${S.of(context).Show} ${filteredBrokers.length}",
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
                                color: states.contains(MaterialState.disabled)
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                          Icons.close,
                          size: screenWidth * 0.045,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          if (selectedGovernorate.isNotEmpty) {
                            setModalState(() {
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
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: screenWidth * 0.05,
                          ),
                        ),
                        hintText: S.of(context).SearchForGovernorateOrCity,
                      ),
                      onChanged: (value) {
                        setModalState(() {
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
                            searchText.isEmpty || gov.toLowerCase().contains(searchText.toLowerCase()))
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
                                    setModalState(() {
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
                              searchText.isEmpty || city.toLowerCase().contains(searchText.toLowerCase()))
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
                                    trailing: _selectedCity == city
                                        ? Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                      child: Icon(
                                        Icons.check,
                                        color: KprimaryColor,
                                        size: screenWidth * 0.05,
                                      ),
                                    )
                                        : null,
                                    onTap: () {
                                      setModalState(() {
                                        selectedCity = city;
                                      });
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

  final List<Broker> brokers = [
    Broker(
      name: "Ahmed Hassan",
      phone: "+20 101 234 5678",
      location: "Cairo",
      city: "New Cairo",
      details: "Luxury real estate expert with 10 years of experience.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: true,
    ),
    Broker(
      name: "Mohamed Ali",
      phone: "+20 102 876 5432",
      location: "Alexandria",
      city: "Smouha",
      details: "Specialist in commercial properties and offices.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: true,
    ),
    Broker(
      name: "Mahmoud Ibrahim",
      phone: "+20 103 654 3210",
      location: "Giza",
      city: "Dokki",
      details: "Experienced in residential and investment properties.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: true,
    ),
    Broker(
      name: "Sara Khaled",
      phone: "+20 104 789 0123",
      location: "Cairo",
      city: "Nasr City",
      details: "Expert in rentals and small property deals.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: false,
    ),
    Broker(
      name: "Ali Mostafa",
      phone: "+20 105 908 7654",
      location: "Cairo",
      city: "Maadi",
      details: "Real estate evaluator and market analyst.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: true,
    ),
    Broker(
      name: "Yasmine Abdullah",
      phone: "+20 106 321 6789",
      location: "Giza",
      city: "Sheikh Zayed",
      details: "High-end property sales and purchases.",
      image: "Assets/٢٠٢٣_٠٧_١١_٠٠_٥١_IMG_2476.JPG",
      isFeatured: false,
    ),
  ];
  final Map<String, List<String>> governoratesWithCities = {
    "Cairo": ["Maadi", "Mokattam", "Nasr City", "Zamalek", "Dokki", "Heliopolis", "Shubra", "New Cairo", "El Marg"],
    "Giza": ["Dokki", "Mohandessin", "Haram", "6th October", "Sheikh Zayed", "Faisal", "Bulaq Dakrour", "Imbaba"],
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
    "Minya": ["New Minya", "Mallawi", "Deir Mawas", "Maghagha", "Abu Qurqas", "Samalout", "Beni Mazar"],
    "Assiut": ["New Assiut", "Dayrout", "Sadfa", "El Badari", "Abnoub", "El Quseyya", "Manfalut"],
    "Sohag": ["Akhmim", "Gerga", "El Maragha", "Tahta", "Sohag City", "Tama"],
    "Qena": ["Qena City", "Nag Hammadi", "Qift", "Farshout", "Deshna"],
    "Luxor": ["Luxor City", "Esna", "Armant", "El-Toud", "New Tiba"],
    "Aswan": ["Aswan City", "Kom Ombo", "Edfu", "Daraw", "New Aswan"],
    "Red Sea": ["Hurghada", "Safaga", "Quseir", "Marsa Alam", "Shalateen"],
    "South Sinai": ["Sharm El-Sheikh", "Dahab", "Nuweiba", "Saint Catherine", "Taba"],
    "North Sinai": ["Arish", "Bir al-Abd", "Sheikh Zuweid", "Rafah"],
    "Ismailia": ["Ismailia City", "Fayed", "Qantara West", "Tell El Kebir"],
    "Port Said": ["Port Said City", "Port Fouad"],
    "Suez": ["Suez City", "Ain Sokhna", "Ataqa"],
    "Beheira": ["Damanhour", "Kafr El Dawwar", "Edku", "Rashid", "Abu Hummus"],
    "Dakahlia": ["Mansoura", "Talkha", "Mit Ghamr", "Sherbin", "Belqas"],
    "Sharqia": ["Zagazig", "10th of Ramadan", "Bilbeis", "Minya El Qamh", "Fakous"],
    "Gharbia": ["Tanta", "El Mahalla El Kubra", "Kafr El Zayat", "Zifta", "Samanoud"],
    "Monufia": ["Shibin El Kom", "Sadat City", "Ashmoun", "Quesna", "Menouf"],
    "Fayoum": ["Fayoum City", "Senoures", "Etsa", "Tamiya", "Youssef El Seddik"],
    "Beni Suef": ["Beni Suef City", "Nasser", "Biba", "El Wasta", "Ihnasya"],
    "Kafr El Sheikh": ["Kafr El Sheikh City", "Desouk", "Baltim", "Motobas", "Fuwwah"],
    "Damietta": ["Damietta City", "New Damietta", "Ras El Bar", "Ezbet El Borg", "Kafr Saad"],
    "New Valley": ["Kharga", "Dakhla", "Baris", "Farafra"],
    "Matrouh": ["Marsa Matrouh", "Siwa", "El Alamein", "Sidi Barrani", "Al Negila"],
  };
}

