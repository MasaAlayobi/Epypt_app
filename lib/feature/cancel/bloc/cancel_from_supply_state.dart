// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cancel_from_supply_bloc.dart';

@immutable
sealed class CancelFromSupplyState {}

final class CancelFromSupplyInitial extends CancelFromSupplyState {}

class FailedGetData extends CancelFromSupplyState {}
class NoConnection extends CancelFromSupplyState {
  String message;
  NoConnection({
    required this.message,
  });
}
class Loading extends CancelFromSupplyState {}
class SuccessGetData extends CancelFromSupplyState {
  List<BillWithReason> oneBill;
   AllBillsWithReason allBills;
  SuccessGetData({
    required this.oneBill,
    required this.allBills,
  });
}