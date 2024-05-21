// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_bill_bloc.dart';

@immutable
sealed class NewBillState {}

final class NewBillInitial extends NewBillState {}

class SuccessGetNewBill extends NewBillState {
  List<BillWithReason> allBills;

  SuccessGetNewBill({
    required this.allBills,
  });
}

class NoInternet extends NewBillState {
  String message;
  NoInternet({
    required this.message,
  });
}

class NoData extends NewBillState {}

class LoadingTestFromAbd extends NewBillState {}

class SuccessRejectBill extends NewBillState {


}

class NoInternetRejectBill extends NewBillState {}

class FaildSendBill extends NewBillState {
 
 
}
