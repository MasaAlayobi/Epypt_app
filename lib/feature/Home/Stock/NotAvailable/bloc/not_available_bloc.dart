import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/add_product_to_available.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'not_available_event.dart';
part 'not_available_state.dart';

class NotAvailableBloc extends Bloc<NotAvailableEvent, NotAvailableState> {
   List<AvailableProductsModel> allProducts = [];
  NotAvailableBloc() : super(NotAvailableInitial()) {
    on<getNotAvailableProducts>((event, emit) async{
       late List<AvailableProductsModel> temp;
        if(event.page==1){
      allProducts.clear();
      print("11111111111111111111111111111111111111111111");
     }
      if(allProducts.isEmpty){
      emit(LoadingProduct());}
        try {
         temp = await StockServicImp().getNotAvailableProduct(event.label,event.page);
          if(event.page==1){
         for (var product in temp) {
          if (!allProducts.any((existingProduct) =>
              existingProduct.id == product.id)) { // استبدل id بالخاصية الفريدة
            allProducts.add(product);
          }
        }
       }else{

        allProducts.addAll(temp);
       }
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(SuccessGetNotAvailableProducts(allProduct: allProducts));
         }
              } 
              catch (e) {
        emit(NoConnectionWithProduct(message: e.toString()));
      
    }
    });
     @override
     Future<void> close() {
    // تفريغ المصفوفة عند إغلاق الـ Bloc
      allProducts.clear();
      return super.close();
     }
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
