// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_bill_bloc.dart';

@immutable
sealed class NewBillEvent {}

class GetAllData extends NewBillEvent {}

class SendReason extends NewBillEvent {
  int idBill;
  Reason reason;
  SendReason({
    required this.idBill,
    required this.reason,
  });
}
