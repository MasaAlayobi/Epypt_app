import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/login_model.dart';
import 'package:mufraty_app/Core/Domain/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<loginUser>((event, emit) async{
        emit(loading());
        try{

      List<String> temp = await AuthServiceTmp().login(event.User);
      if(temp.isNotEmpty){
        emit(successcreatedUser(message: temp[0], storeName: temp[1]));
      }
      else if(temp=='your provided credentials cannot be verified.'){
         emit (InformationError(message:'يرجى التأكد من المعلومات إعادة المحاولة' ));
      }
        }catch(e){
          emit(NoConnection(message: e.toString()));
        }
      
    });
  }
}
