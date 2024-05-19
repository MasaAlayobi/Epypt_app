// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_bill_time_bloc.dart';

@immutable
sealed class UpdateBillTimeEvent {}

class SendDate extends UpdateBillTimeEvent {
  int id;
  List<Map<String, int>> update;
  String delivery;
  SendDate({
    required this.id,
    required this.update,
    required this.delivery,
  });
}
class SendDataWithoutTime extends UpdateBillTimeEvent {
  int id;
  List<Map<String, int>> update;
  
  SendDataWithoutTime({
    required this.id,
    required this.update,

  });
}