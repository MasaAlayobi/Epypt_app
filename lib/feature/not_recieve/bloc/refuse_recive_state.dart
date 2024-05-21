// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'refuse_recive_bloc.dart';

@immutable
sealed class RefuseReciveState {}

final class RefuseReciveInitial extends RefuseReciveState {}

class FailedGetData extends RefuseReciveState {}
class NoConnection extends RefuseReciveState {
  String message;
  NoConnection({
    required this.message,
  });
}
class Loading extends RefuseReciveState {}
class SuccessGetData extends RefuseReciveState {
  List<BillWithReason> oneBill;
   AllBillsWithReason allBills;
  SuccessGetData({
    required this.oneBill,
    required this.allBills,
  });
}