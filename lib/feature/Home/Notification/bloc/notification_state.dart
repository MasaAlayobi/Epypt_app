// ignore_for_file: public_member_api_docs, sort_constructors_first
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
class SuccessReadNotification extends NotificationState {
  String message;
  SuccessReadNotification({
    required this.message,
  });
}
