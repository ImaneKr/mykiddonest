import 'dart:convert';
import 'dart:developer';

import 'package:appmobile/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentController with ChangeNotifier {
  final _baseUrl = 'https://upward-native-eft.ngrok-free.app/payment';

  Future<String> createCustomer({
    required String name,
    required String email,
    required String phone,
    required String state,
    required String address,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/create-customer'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'state': state,
          'address': address,
        }),
      );

      if (response.statusCode == 200) {
        final customerData = jsonDecode(response.body);
        return customerData['id'];
      } else {
        throw Exception('Failed to create customer');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createCheckout(PaymentModel paymentModel) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/create-checkout'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(paymentModel.toJson()),
      );

      if (response.statusCode == 200) {
        final checkoutData = jsonDecode(response.body);
        return checkoutData;
      } else {
        throw Exception('Failed to create checkout');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
