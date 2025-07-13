import 'package:flutter/material.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'BrokerDetailsPage.dart';
import 'Widgets/BrokerObject.dart';

class Payment extends StatefulWidget {
  final Broker broker;
  final String selectedPlan;

  const Payment({Key? key, required this.broker, required this.selectedPlan}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
        title: S.of(context).PaymentMethod,
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
                S.of(context).ChoosePaymentMethod,
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
                    S.of(context).PayNow,
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
                S.of(context).PaymentProcessing,
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
                S.of(context).ProcessingBankPayment,
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
                S.of(context).PaymentSuccessful,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c356b),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                S.of(context).SubscriptionPlaced,
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
                  S.of(context).Done,
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
