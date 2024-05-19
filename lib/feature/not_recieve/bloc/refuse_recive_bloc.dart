import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/data/all_bills_with_reason.dart';
import 'package:mufraty_app/Core/data/bill_with_reason.dart';


part 'refuse_recive_event.dart';
part 'refuse_recive_state.dart';

class RefuseReciveBloc extends Bloc<RefuseReciveEvent, RefuseReciveState> {
  RefuseReciveBloc() : super(RefuseReciveInitial()) {
    on<GetAllData>((event, emit) async {
      emit(Loading());
      try {
        var response = await BillServiceImpl().refuseRecive();

        var data = AllBillsWithReason.fromMap(response);
        List<BillWithReason> listbill = List.generate(response["bills"].length,
            (index) => BillWithReason.fromMap(response["bills"][index]));
        if (listbill.isNotEmpty) {
          emit(SuccessGetData(allBills: data, oneBill: listbill));
        } else if (listbill.isEmpty) {
          emit(FailedGetData());
        }
      } catch (e) {
        emit(NoConnection());
      }
    });
  }
}
