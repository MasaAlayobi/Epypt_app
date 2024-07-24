// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_bill_time_bloc.dart';

@immutable
sealed class UpdateBillTimeState {}

final class UpdateBillTimeInitial extends UpdateBillTimeState {}

class SuccessSendUpdateWithTime extends UpdateBillTimeState {
  String message;
  SuccessSendUpdateWithTime({
    required this.message,
  });
}

class FailedSendUpdateWithTime extends UpdateBillTimeState {}

class Loading extends UpdateBillTimeState {}

class NoInternet extends UpdateBillTimeState {}
