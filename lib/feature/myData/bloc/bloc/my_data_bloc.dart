import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/editName.dart';
import 'package:mufraty_app/Core/Data/supplier-response.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';

part 'my_data_event.dart';
part 'my_data_state.dart';

class MyDataBloc extends Bloc<MyDataEvent, MyDataState> {
  MyDataBloc() : super(MyDataInitial()) {
    on<GetAllData>((event, emit) async {
      emit(SupplierLoading());

      try {
        var response = await BillServiceImpl().myData();
        var data = SupplierResponse.fromMap(response);

        emit(SupplierLoaded(data));
        if (response == "false") {
          emit(SupplierError());
        }
      } catch (e) {
        print(e);
      }
    });

    on<EditName>((event, emit) async {
      emit(LoadingEditName());

      try {
        var response = await BillServiceImpl().editNameInMyData(event.names);
        if (response == "true") {
          print("creat success in bloc");

          emit(SuccessEditName());
        } else {
          emit(FailedEditName());
        }
      } catch (e) {
        print(e);
      }
    });

    on<EditCity>((event, emit) async {
      emit(LoadingEditCity());

      try {
        var response = await BillServiceImpl().editCitiesInMyData(event.cities);

        print("creat success in bloc");
        emit(SuccessEditCity(message: response));
        if (response == "false") {
          emit(FailedEditCity());
        }
      } catch (e) {
        print(e);
        emit(NoInternet());
      }
    });
  }
}
