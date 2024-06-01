import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/notfiication_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<getNotification>((event, emit) async{
      emit(LoadingNotification());
       late List<NotfiicationModel> temp;
      try {
     
        temp = await StockServicImp().getNotification();
        // print(temp);
        
        if (temp.isEmpty) {
          emit(NotFound());
        } else {
          emit(SuccessFetchNotification(allProduct: temp));
        }
      } catch (e) {
        emit(NoConnectionWithNotification(message: e.toString()));
       }
    });
  }
}
