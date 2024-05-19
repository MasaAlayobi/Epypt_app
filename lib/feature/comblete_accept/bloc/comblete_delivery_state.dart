part of 'comblete_delivery_bloc.dart';

@immutable
sealed class CombleteDeliveryState {}

final class CombleteDeliveryInitial extends CombleteDeliveryState {}



class FailedGetData extends CombleteDeliveryState {}
class NoConnection extends CombleteDeliveryState {}
class Loading extends CombleteDeliveryState {}
class SuccessGetData extends CombleteDeliveryState {
  List<BillWithReason> oneBill;
   AllBillsWithReason allBills;
  SuccessGetData({
    required this.oneBill,
    required this.allBills,
  });
}