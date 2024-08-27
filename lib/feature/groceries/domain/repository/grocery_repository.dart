import 'package:dartz/dartz.dart';
import 'package:grocessary/core/error/failure.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';

abstract class GroceryRepository {
  Future<Either<Failure,List<GroceryItemEntity>>> getGroceries();
  Future<Either<Failure,GroceryItemEntity>> getGroceryById(String id);
}
