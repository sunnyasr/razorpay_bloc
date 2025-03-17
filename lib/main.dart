import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:razorpay_integration/repository/razorpay/razorpay_repository.dart';
import 'package:razorpay_integration/views/razorpay/razorpay_screen.dart';

final GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RazorpayScreen(),
    );
  }
}

serviceLocator() {
  getIt.registerLazySingleton<RazorpayRepository>(() => RazorpayRepository());
}
