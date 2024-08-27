import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entity/groceryItem_entity.dart';
import '../../domain/usecases/get_grocery_by_id.dart';
import '../../domain/usecases/get_groceries.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetGroceries getGroceries;
  final GetGroceryById getGroceryById;

  GroceryBloc({
    required this.getGroceries,
    required this.getGroceryById,
  }) : super(GroceryInitial()) {
    on<LoadAllGroceriesEvent>((event, emit) async {
      emit(GroceryLoading());

      final result = await getGroceries.execute();
      result.fold(
        (failure) => emit(GroceryErrorState(failure.message)),
        (groceries) => emit(LoadedAllGroceriesState(groceries)),
      );
    });

    on<LoadSingleGroceryEvent>((event, emit) async {
      emit(GroceryLoading());

      final result = await getGroceryById.execute(event.id);
      result.fold(
        (failure) => emit(GroceryErrorState(failure.message)),
        (grocery) => emit(LoadedSingleGroceryState(grocery)),
      );
    });
  }
}
