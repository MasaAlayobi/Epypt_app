// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brebaring_bloc.dart';

@immutable
sealed class BrebaringEvent {}

class CancelRecieve extends BrebaringEvent {
  Reason reason;
  int id;
  CancelRecieve({
    required this.reason,
    required this.id,
  });
}
class GetAllDataBrebaring extends BrebaringEvent {}
class CombleteReceive extends BrebaringEvent {
  RecivePriceBill
   reason;
  int id;
  CombleteReceive({
    required this.reason,
    required this.id,
  });
}
