import 'package:equatable/equatable.dart';

abstract class RazorpayState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RazorpayInitial extends RazorpayState {}

class RazorpayLoading extends RazorpayState {}

class RazorpaySuccess extends RazorpayState {
  final String paymentId;

  RazorpaySuccess({required this.paymentId});

  @override
  // TODO: implement props
  List<Object?> get props => [paymentId];
}

class RazorpayFailure extends RazorpayState {
  final String error;

  RazorpayFailure({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class RazorpayCanceled extends RazorpayState {}
