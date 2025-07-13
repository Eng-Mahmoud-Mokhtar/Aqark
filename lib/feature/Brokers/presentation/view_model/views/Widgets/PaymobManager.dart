import 'package:dio/dio.dart';

class PaymobManager {
  final String apiKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBMU1ESTFNU3dpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS4tVnBkWXFZLTNuSUNRazdFY0NJMHlWalcwcE93blYtT1Jnd3BzbmNLTk5OdFJ5eURNRzJCQnZfMkxGMVhoX05fVDMwWEJoYnpJWlhaUjNDekZiUG8zUQ==";

  Future<String> getPaymentKey(
      int amount,
      String currency,
      Map<String, dynamic> billingData,
      int integrationId,
      ) async {
    try {
      String authenticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authenticationToken: authenticationToken,
        amount: amount.toString(),
        currency: currency,
      );
      String paymentKey = await _getPaymentKey(
        authenticationToken: authenticationToken,
        amount: amount.toString(),
        currency: currency,
        orderId: orderId.toString(),
        billingData: billingData,
        integrationId: integrationId,
      );
      return paymentKey;
    } catch (e) {
      throw Exception("Payment processing failed: $e");
    }
  }

  Future<String> _getAuthenticationToken() async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {
          "api_key": apiKey,
        },
      );
      return response.data["token"];
    } catch (e) {
      throw Exception("Failed to get authentication token: $e");
    }
  }

  Future<int> _getOrderId({
    required String authenticationToken,
    required String amount,
    required String currency,
  }) async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/ecommerce/orders",
        data: {
          "auth_token": authenticationToken,
          "amount_cents": amount,
          "currency": currency,
          "delivery_needed": "false",
          "items": [],
        },
      );
      return response.data["id"];
    } catch (e) {
      throw Exception("Failed to create order: $e");
    }
  }

  Future<String> _getPaymentKey({
    required String authenticationToken,
    required String amount,
    required String currency,
    required String orderId,
    required Map<String, dynamic> billingData,
    required int integrationId,
  }) async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "auth_token": authenticationToken,
          "amount_cents": amount,
          "expiration": 3600,
          "order_id": orderId,
          "currency": currency,
          "integration_id": integrationId,
          "billing_data": billingData,
          "lock_order_when_paid": "false"
        },
      );
      return response.data["token"];
    } catch (e) {
      throw Exception("Failed to get payment key: $e");
    }
  }
}
