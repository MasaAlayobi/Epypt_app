// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}
class getNotification extends NotificationEvent{}
class readNotification extends NotificationEvent {
  String id;
  readNotification({
    required this.id,
  });
}
