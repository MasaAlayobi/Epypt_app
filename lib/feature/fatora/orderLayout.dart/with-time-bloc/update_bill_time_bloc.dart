import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';


part 'update_bill_time_event.dart';
part 'update_bill_time_state.dart';

class UpdateBillTimeBloc
    extends Bloc<UpdateBillTimeEvent, UpdateBillTimeState> {
  UpdateBillTimeBloc() : super(UpdateBillTimeInitial()) {
    on<SendDate>((event, emit) async {
    
      var response =
          await BillServiceImpl().updateBillTime(event.id, event.update,event.delivery);
      try {
        if (response == "true") {
          emit(SuccessSendUpdateWithTime());
        } else if (response == "false") {
          emit(FailedSendUpdateWithTime());
        } else {
          emit(NoInternet());
        }
      } catch (e) {
        print(e);
      }
    });
      on<SendDataWithoutTime>((event, emit) async {
    
      var response =
          await BillServiceImpl().updateBillWithoutTimee(event.id, event.update);
      try {
        if (response == "true") {
          emit(SuccessSendUpdateWithTime());
        } else if (response == "false") {
          emit(FailedSendUpdateWithTime());
        } else {
          emit(NoInternet());
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
