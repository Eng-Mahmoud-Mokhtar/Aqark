import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utiles/AppBar.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../generated/l10n.dart';
import 'Payments.dart';
import 'Widgets/BrokerObject.dart';
import 'Widgets/PaymobManager.dart';

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
        title: S.of(context).Subscription,
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
                    AssetsData.Logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Text(
                S.of(context).ChooseYourPlan,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title:S.of(context).MonthlySubscription,
                price: "\$19.99 / ${S.of(context).month}",
                description:
                "Ideal for short-term needs. Get instant access to premium listings, verified brokers, and top property opportunities — with the flexibility to cancel anytime.",
                onSubscribe: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Payment(
                        broker: broker,
                        selectedPlan: "${S.of(context).MonthlySubscription} - \$19.99 / ${S.of(context).month}",
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildPlanCard(
                context,
                title:S.of(context).YearlySubscription,
                price: "\$199.99 / ${S.of(context).year}",
                description:
                "Best value! Save over 15% by subscribing yearly. Enjoy uninterrupted access to all premium features, early listings, and exclusive broker deals for a full year.",
                isPopular: true,
                onSubscribe: () async => await _pay(context, 199.99, S.of(context).EGP),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pay(BuildContext context, double amount, String currency) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(color: KprimaryColor),
        ),
      );

      final billingData = {
        "apartment": "NA",
        "email": "user@example.com",
        "floor": "NA",
        "first_name": "John",
        "street": "NA",
        "building": "NA",
        "phone_number": "+201000000000",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "Doe",
        "state": "NA"
      };

      const integrationId = 5130143;

      String paymentKey = await PaymobManager().getPaymentKey(
        (amount * 100).toInt(),
        currency,
        billingData,
        integrationId,
      );

      Navigator.pop(context);

      final url = Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/928437?payment_token=$paymentKey",
      );

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cannot open payment page")),
        );
      }
    } catch (e, stackTrace) {
      Navigator.pop(context);
      print('Payment error: $e');
      print(stackTrace);

      final screenWidth = MediaQuery.of(context).size.width;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenWidth * 0.04, screenWidth * 0.04, 20),
          content: SizedBox(
            width: screenWidth,
            height: screenWidth * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red.shade700,
                  size: screenWidth * 0.15,
                ),
                const SizedBox(height: 20),
                Text(
                  "An error occurred during loading.\nPlease try again .",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: SubText,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: screenWidth * 0.12,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      S.of(context).TryAgain,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildPlanCard(
      BuildContext context, {
        required String title,
        required String price,
        required String description,
        bool isPopular = false,
        required Future<void> Function() onSubscribe,
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
                onPressed: () => onSubscribe(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, screenWidth * 0.12),
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  S.of(context).SubscribeNow,
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
                S.of(context).MostPopular,
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
