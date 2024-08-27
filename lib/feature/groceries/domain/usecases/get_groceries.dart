import 'package:dartz/dartz.dart';
import 'package:grocessary/core/error/failure.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/domain/repository/grocery_repository.dart';

class GetGroceries {
  final GroceryRepository repository;

  GetGroceries(this.repository);

  Future<Either<Failure,List<GroceryItemEntity>>> execute() async {
    return await repository.getGroceries();
  }
}
