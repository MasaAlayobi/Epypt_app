import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/data/all_bills_with_reason.dart';
import 'package:mufraty_app/Core/data/bill_with_reason.dart';

part 'cancel_from_supply_event.dart';
part 'cancel_from_supply_state.dart';

class CancelFromSupplyBloc extends Bloc<CancelFromSupplyEvent, CancelFromSupplyState> {
  CancelFromSupplyBloc() : super(CancelFromSupplyInitial()) {

   on<GetAllData>((event, emit) async {

      emit(Loading());
      try {
        var response = await BillServiceImpl().cancel();

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
