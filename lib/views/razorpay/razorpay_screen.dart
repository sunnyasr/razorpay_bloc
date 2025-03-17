import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_integration/bloc/razorpay/razorpay_bloc.dart';
import 'package:razorpay_integration/bloc/razorpay/razorpay_event.dart';
import 'package:razorpay_integration/bloc/razorpay/razorpay_state.dart';
import 'package:razorpay_integration/main.dart';
import 'package:razorpay_integration/repository/razorpay/razorpay_repository.dart';

class RazorpayScreen extends StatefulWidget {
  const RazorpayScreen({super.key});

  @override
  State<RazorpayScreen> createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends State<RazorpayScreen> {
  late RazorpayBloc _razorpayBloc;

  @override
  void initState() {
    super.initState();

    _razorpayBloc = RazorpayBloc(razorpayRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Razorpay Gateway')),
      body: BlocProvider(
        create: (_) => _razorpayBloc,
        child: BlocConsumer<RazorpayBloc, RazorpayState>(
          listener: (context, state) {
            if (state is RazorpaySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Payment success ${state.paymentId}')),
              );
            } else if (state is RazorpayFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Payment failed: ${state.error}')),
              );
            } else if (state is RazorpayCanceled) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Payment canceled')));
            }
          },
          builder: (context, state) {
            if (state is RazorpayLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<RazorpayBloc>().add(InitialPayment(amount: 100));
                },
                child: Text("Pay ₹100"),
              ),
            );
          },
        ),
      ),
    );
  }
}
