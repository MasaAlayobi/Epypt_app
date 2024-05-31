// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'not_available_bloc.dart';

@immutable
sealed class NotAvailableEvent {}
class getNotAvailableProducts extends NotAvailableEvent {
  String label;
  getNotAvailableProducts({
    required this.label,
  });
}
class AddToAvailable extends NotAvailableEvent {
 num id;
 num is_available;
  AddToAvailable({
    required this.id,
    required this.is_available,
  });
}