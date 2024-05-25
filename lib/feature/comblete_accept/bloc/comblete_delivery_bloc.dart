import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/bill_with_reason.dart';

import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/data/all_bills_with_reason.dart';

part 'comblete_delivery_event.dart';
part 'comblete_delivery_state.dart';

class CombleteDeliveryBloc
    extends Bloc<CombleteDeliveryEvent, CombleteDeliveryState> {
  CombleteDeliveryBloc() : super(CombleteDeliveryInitial()) {
    on<GetAllData>((event, emit) async {
      emit(Loading());
      try {
        var response = await BillServiceImpl().accept();

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
        emit(NoConnection(message: e.toString()));
      }
    });
  }
}
