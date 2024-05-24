import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<logout>((event, emit) async{
      emit(loadingLogout());
      String temp=await StockServicImp().logout();
      try{
      if(temp=="تم تسجيل الخروج بنجاح"){
        emit(successlogout(message: temp));
      }}catch(e) {
        emit(NoConnection(message: temp));
      }
    });
  }
}
