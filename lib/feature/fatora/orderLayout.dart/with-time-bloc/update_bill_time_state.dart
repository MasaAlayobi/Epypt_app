part of 'update_bill_time_bloc.dart';

@immutable
sealed class UpdateBillTimeState {}

final class UpdateBillTimeInitial extends UpdateBillTimeState {}
class SuccessSendUpdateWithTime extends UpdateBillTimeState{

}
class FailedSendUpdateWithTime extends UpdateBillTimeState{

}
class Loading extends UpdateBillTimeState{

}
class NoInternet extends UpdateBillTimeState{}