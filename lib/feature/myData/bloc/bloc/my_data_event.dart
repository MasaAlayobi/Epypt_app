part of 'my_data_bloc.dart';

@immutable
sealed class MyDataEvent {}

class GetAllData extends MyDataEvent {}

class EditName extends MyDataEvent {
  EditNameRequest names;
  EditName({required this.names});
}

class EditCity extends MyDataEvent {
  late List<int> cities;
  EditCity({required this.cities});
}
