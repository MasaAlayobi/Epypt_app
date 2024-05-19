// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brebaring_bloc.dart';

@immutable
sealed class BrebaringState {}

final class BrebaringInitial extends BrebaringState {}

class SuccessCancel extends BrebaringState {}

class FailedCancel extends BrebaringState {}

class NoConnection extends BrebaringState {}

class SuccessGetData extends BrebaringState {
  List<BillWithReason> oneBill;
   AllBillsWithReason allBills;
  SuccessGetData({
    required this.oneBill,
    required this.allBills,
  });
}

class FailedGetData extends BrebaringState {}

class SuccessCombleteRecieve extends BrebaringState {}

class FailedCombleteRecieve extends BrebaringState {}
