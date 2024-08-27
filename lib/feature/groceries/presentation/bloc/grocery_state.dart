part of 'grocery_bloc.dart';

sealed class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

final class GroceryInitial extends GroceryState {}

final class GroceryLoading extends GroceryState {}

final class LoadedSingleGroceryState extends GroceryState {
  final GroceryItemEntity grocery;

  const LoadedSingleGroceryState(this.grocery);

  @override
  List<Object> get props => [grocery];
}

class LoadedAllGroceriesState extends GroceryState {
  final List<GroceryItemEntity> groceries;

  const LoadedAllGroceriesState(this.groceries);

  @override
  List<Object> get props => [groceries];
}

class GroceryErrorState extends GroceryState {
  final String message;

  const GroceryErrorState(this.message);

  @override
  List<Object> get props => [message];
}
