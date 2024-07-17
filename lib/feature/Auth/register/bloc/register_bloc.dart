import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/cities_model.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Domain/auth_service.dart';
import 'package:mufraty_app/Core/data/categories_suppler_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<CreateUser>((event, emit) async{
     List<String> temp;
         emit(loading());
          // try{

       temp = await AuthServiceTmp().createNewAcouunt(event.User,event.image);
      if(temp.isNotEmpty){
        emit(successcreatedUser(message: temp[0], storeName: temp[1]));
      }
        //  }catch(e){

        // emit (NoConnection(message:e.toString()));
        //  }
      
    });
    List<CitiesModel> temp;
    on<getCities>((event, emit) async{
      emit(loading());
         try {
         temp = await AuthServiceTmp().getCities();
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(successFetchCities(Cities: temp));
         }
              } 
              catch (e) {
        emit(NoConnection(message: e.toString()));
      
    }
    });
     List<CategoriesSupplerModel> Suppler;
    on<getCategoriesSuppler>((event, emit) async{
      emit(loading());
          try {
         Suppler = await AuthServiceTmp().getCategorySuppler();
        print(Suppler);
        if (Suppler.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(successFetchCategories(Suppler: Suppler));
         }
              } 
              catch (e) {
        emit(NoConnection(message: e.toString()));
      
    }
    });
  }
  
}
