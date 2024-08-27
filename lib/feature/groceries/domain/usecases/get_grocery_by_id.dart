import 'package:dartz/dartz.dart';
import 'package:grocessary/core/error/failure.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/domain/repository/grocery_repository.dart';

class GetGroceryById {
  final GroceryRepository repository;

  GetGroceryById(this.repository);

  Future<Either<Failure,GroceryItemEntity>> execute(String id) async {
    return await repository.getGroceryById(id);
  }
}
