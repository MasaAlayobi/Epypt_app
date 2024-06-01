part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}
class getNotification extends NotificationEvent{}