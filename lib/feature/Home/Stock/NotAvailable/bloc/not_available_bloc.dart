import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/add_product_to_available.dart';
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
         temp = await StockServicImp().getNotAvailableProduct(event.label);
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(SuccessGetNotAvailableProducts(allProduct: temp));
         }
              } 
              catch (e) {
        emit(NoConnectionWithProduct(message: e.toString()));
      
    }
    });
     on<AddToAvailable>(
      (event, emit) async {
         emit(LoadingUpdate(message: 'جاري التحديث .....'));
        try {
          String message = await StockServicImp()
              .addNotToAvailable(event.id, event.product);
          print(message);
          if (message == 'true') {
            // print('true');
            //  emit(SuccessFetchAvailableProducts(allProduct: temp));
             emit(successAddAvailable(message: "تم نقل المنتج إلى المتاح"));
            //  print(message);
          } else if (message == "Validation error") {
            emit(InformationError(message: message));
          }
        } catch (e) {
          emit(NoConnectionAddProduct(message: 'خطأ في الاتصال'));
        }
      },
    );
  }
}
