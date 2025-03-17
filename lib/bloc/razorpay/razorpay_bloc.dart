import 'package:bloc/bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_integration/bloc/razorpay/razorpay_event.dart';
import 'package:razorpay_integration/bloc/razorpay/razorpay_state.dart';
import 'package:razorpay_integration/repository/razorpay/razorpay_repository.dart';

class RazorpayBloc extends Bloc<RazorpayEvent, RazorpayState> {
  final RazorpayRepository razorpayRepository;

  RazorpayBloc({required this.razorpayRepository}) : super(RazorpayInitial()) {
    razorpayRepository.razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      _handlePaymentSuccess,
    );
    razorpayRepository.razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      _handlePaymentFailure,
    );
    razorpayRepository.razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      _handleExternalWallet,
    );

    on<InitialPayment>(_onInitialPayment);
    on<PaymentSuccess>(_onPaymentSuccess);
    on<PaymentFailure>(_onPaymentFailure);
    on<PaymentCanceled>(_onPaymentCanceled);
  }

  void _onInitialPayment(InitialPayment event, Emitter<RazorpayState> emit) {
    emit(RazorpayLoading());

    var options = {
      'key': '',
      'amount': (event.amount * 100).toInt(),
      'currency': event.currency,
      'name': 'App Name',
      'description': 'Test payment',
      'prefill': {'contact': '+917837678085', 'email': 'sunny@gmail.com'},
    };

    try {
      razorpayRepository.razorpay.open(options);
    } catch (e) {
      emit(RazorpayFailure(error: e.toString()));
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    add(PaymentSuccess(paymentId: response.paymentId.toString()));
  }

  void _handlePaymentFailure(PaymentFailureResponse response) {
    add(PaymentFailure(error: response.message ?? "Payment failed"));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    add(PaymentCanceled());
  }

  void _onPaymentSuccess(PaymentSuccess event, Emitter<RazorpayState> emit) {
    emit(RazorpaySuccess(paymentId: event.paymentId));
  }

  void _onPaymentFailure(PaymentFailure event, Emitter<RazorpayState> emit) {
    emit(RazorpayFailure(error: event.error));
  }

  void _onPaymentCanceled(PaymentCanceled event, Emitter<RazorpayState> emit) {
    emit(RazorpayCanceled());
  }

  @override
  Future<void> close() {
    razorpayRepository.dispose();
    return super.close();
  }
}
