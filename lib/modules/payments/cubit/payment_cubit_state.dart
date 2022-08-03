part of 'payment_cubit_cubit.dart';

@immutable
abstract class PaymentCubitState {}

class PaymentCubitInitial extends PaymentCubitState {}

class LoadingFirstToken extends PaymentCubitState {}
class SuccessFirstToken extends PaymentCubitState {}
class FailFirstToken extends PaymentCubitState {}

class LoadingGetOrderId extends PaymentCubitState {}
class SuccessGetOrderId extends PaymentCubitState {}
class FailGetOrderId extends PaymentCubitState {}

class LoadingLastToken extends PaymentCubitState {}
class SuccessLastToken extends PaymentCubitState {}
class FailLastToken extends PaymentCubitState {}

class LoadingKioskCode extends PaymentCubitState {}
class SuccessKioskCode extends PaymentCubitState {}
class FailKioskCode extends PaymentCubitState {}