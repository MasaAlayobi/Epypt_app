import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Domain/auth_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<CreateUser>((event, emit) async{
         emit(loading());
      bool temp = await AuthServiceTmp().createNewAcouunt(event.User, event.image);
      if(temp){
        emit(successcreatedUser());
      }else{
        emit (NoConnection());
      }
    });
  }
}
