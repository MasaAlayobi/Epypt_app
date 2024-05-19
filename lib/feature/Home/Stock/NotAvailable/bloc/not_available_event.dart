part of 'not_available_bloc.dart';

@immutable
sealed class NotAvailableEvent {}
class getNotAvailableProducts extends NotAvailableEvent{}
class AddToAvailable extends NotAvailableEvent {
 num id;
 num is_available;
  AddToAvailable({
    required this.id,
    required this.is_available,
  });
}