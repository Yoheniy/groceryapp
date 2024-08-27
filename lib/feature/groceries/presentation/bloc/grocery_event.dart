part of 'grocery_bloc.dart';

sealed class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class LoadAllGroceriesEvent extends GroceryEvent {}

class LoadSingleGroceryEvent extends GroceryEvent {
  final String id;

  const LoadSingleGroceryEvent(this.id);

  @override
  List<Object> get props => [id];
}
