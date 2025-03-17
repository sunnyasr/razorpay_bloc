import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayRepository {
  final Razorpay _razorpay = Razorpay();

  Razorpay get razorpay => _razorpay;

  void dispose() {
    _razorpay.clear();
  }
}
