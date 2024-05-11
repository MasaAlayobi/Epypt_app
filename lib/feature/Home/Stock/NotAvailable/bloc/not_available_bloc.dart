import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'not_available_event.dart';
part 'not_available_state.dart';

class NotAvailableBloc extends Bloc<NotAvailableEvent, NotAvailableState> {
  NotAvailableBloc() : super(NotAvailableInitial()) {
    on<getNotAvailableProducts>((event, emit) async{
       late List<AvailableProductsModel> temp;
      emit(LoadingProduct());
        try {
         temp = await StockServicImp().getNotAvailableProduct();
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(SuccessGetNotAvailableProducts(allProduct: temp));
         }
              } 
              catch (e) {
        emit(NoConnectionWithProduct());
      
    }
    });
  }
}
