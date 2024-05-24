// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stock_bloc.dart';

@immutable
sealed class StockState {}

final class StockInitial extends StockState {}
class successlogout extends StockState {
  String message;
  successlogout({
    required this.message,
  });
  
}
class loadingLogout extends StockState{}
class NoConnection extends StockState {
  String message;
  NoConnection({
    required this.message,
  });
}
