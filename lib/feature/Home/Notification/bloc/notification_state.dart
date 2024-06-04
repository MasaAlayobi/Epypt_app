part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}
class SuccessFetchNotification extends NotificationState {
  List<NotfiicationModel> notification;
  SuccessFetchNotification({
    required this.notification,
  });
  
}
class NoConnectionWithNotification extends NotificationState {
  String message;
  NoConnectionWithNotification({
    required this.message,
  });
}
class LoadingNotification extends NotificationState{}
class NotFound extends NotificationState{}
