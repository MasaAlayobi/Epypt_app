import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/bill_with_reason.dart';

import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/data/all_bills_with_reason.dart';

import 'package:mufraty_app/Core/data/reasonReject.dart';

part 'new_bill_event.dart';
part 'new_bill_state.dart';

class NewBillBloc extends Bloc<NewBillEvent, NewBillState> {
  NewBillBloc() : super(NewBillInitial()) {
    on<GetAllData>((event, emit) async {
      emit(LoadingTestFromAbd());

      try {
        var response = await BillServiceImpl().Newbill();
        var data = AllBillsWithReason.fromMap(response);
        List<BillWithReason> listbill = List.generate(response["bills"].length,
            (index) => BillWithReason.fromMap(response["bills"][index]));
        // List<PaymentMethod> payment= List.generate(listbill.length, (index) => );
        print(data.Count);
        if (listbill.isNotEmpty) {
          emit(SuccessGetNewBill(allBills: listbill));
        } else if (listbill.isEmpty) {
          print("no daata");
          emit(NoData());
        }
      } catch (e) {
        emit(NoInternet(message: e.toString()));
      }
    });
    on<SendReason>((event, emit) async {
      var response =
          await BillServiceImpl().rejectBill(event.idBill, event.reason);
      if (response == "true") {
        emit(SuccessRejectBill());
      } else {
        emit(FaildSendBill());
      }
    });
  }
}
