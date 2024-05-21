// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comblete_delivery_bloc.dart';

@immutable
sealed class CombleteDeliveryState {}

final class CombleteDeliveryInitial extends CombleteDeliveryState {}



class FailedGetData extends CombleteDeliveryState {}
class NoConnection extends CombleteDeliveryState {
  String message;
  NoConnection({
    required this.message,
  });
}
class Loading extends CombleteDeliveryState {}
class SuccessGetData extends CombleteDeliveryState {
  List<BillWithReason> oneBill;
   AllBillsWithReason allBills;
  SuccessGetData({
    required this.oneBill,
    required this.allBills,
  });
}