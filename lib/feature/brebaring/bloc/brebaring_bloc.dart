import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/data/all_bills_with_reason.dart';
import 'package:mufraty_app/Core/data/bill_with_reason.dart';
import 'package:mufraty_app/Core/data/reasonReject.dart';
import 'package:mufraty_app/Core/data/recivePrice.dart';


part 'brebaring_event.dart';
part 'brebaring_state.dart';

class BrebaringBloc extends Bloc<BrebaringEvent, BrebaringState> {
  BrebaringBloc() : super(BrebaringInitial()) {
    on<CancelRecieve>((event, emit) async {
      try {
        var response =
            await BillServiceImpl().cancelRecieve(event.id, event.reason);

        if (response == "true") {
          emit(SuccessCancel());
        } else {
          emit(FailedCancel());
        }
      } catch (e) {
        emit(NoConnectionWithGet(message: e.toString()));
      }
    });
    on<CombleteReceive>((event, emit) async {
      try {
        var response =
            await BillServiceImpl().combleteRecieve(event.id, event.reason);

        if (response == "تم بنجاح") {
          emit(SuccessCombleteRecieve());
        } else if (response == "unknown query exception") {
          emit(FailedCombleteRecieve());
        } else {
          // emit
        }
      } catch (e) {
        emit(NoConnection());
      }
    });
    on<GetAllDataBrebaring>((event, emit) async {
      try {
        var response = await BillServiceImpl().brebaring();
        var data = AllBillsWithReason.fromMap(response);
        List<BillWithReason> listbill = List.generate(response["bills"].length,
            (index) => BillWithReason.fromMap(response["bills"][index]));
        // List<PaymentMethod> payment= List.generate(listbill.length, (index) => );

        if (listbill.isNotEmpty) {
          emit(SuccessGetData(allBills: data, oneBill: listbill));
        } else if (listbill.isEmpty) {
          emit(FailedGetData());
        }
      } catch (e) {
        emit(NoConnectionWithGet(message: e.toString()));
      }
    });
  }
}
