import 'package:equatable/equatable.dart';

abstract class RazorpayEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialPayment extends RazorpayEvent {
  final double amount;
  final String currency;

  InitialPayment({required this.amount, this.currency = "INR"});

  @override
  List<Object> get props => [amount, currency];
}

class PaymentSuccess extends RazorpayEvent {
  final String paymentId;

  PaymentSuccess({required this.paymentId});

  @override
  List<Object> get props => [paymentId];
}

class PaymentFailure extends RazorpayEvent {
  final String error;

  PaymentFailure({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class PaymentCanceled extends RazorpayEvent {}
