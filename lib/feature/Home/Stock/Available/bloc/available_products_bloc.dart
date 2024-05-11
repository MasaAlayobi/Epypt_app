import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'available_products_event.dart';
part 'available_products_state.dart';

class AvailableProductsBloc extends Bloc<AvailableProductsEvent, AvailableProductsState> {
  AvailableProductsBloc() : super(AvailableProductsInitial()) {
    on<getAvailableProducts>((event, emit) async{
      late List<AvailableProductsModel> temp;
      emit(LoadingProduct());
       try {
         temp = await StockServicImp().getAvailableProduct();
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(SuccessFetchAvailableProducts(allProduct: temp));
         }
              } 
              catch (e) {
        emit(NoConnectionWithProduct());
      
    }
    });
  }
}
