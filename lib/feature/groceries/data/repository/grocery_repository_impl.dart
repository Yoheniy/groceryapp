
import 'package:grocessary/core/network/network_info.dart';
import 'package:grocessary/feature/groceries/data/datasource/grocery_remote_datasource.dart';
import 'package:grocessary/feature/groceries/data/models/grocery_model.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/domain/repository/grocery_repository.dart';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';


class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;
   final NetworkInfo networkInfo;

  GroceryRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

 

  @override
  Future<Either<Failure, List<GroceryItemEntity>>> getGroceries() async {
    if (await networkInfo.isConnected) {
    try {
      final groceries = await remoteDataSource.fetchGroceries();
      return Right(groceries.map((grocery) => grocery.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure("failed to fetch"));
    }
  }else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, GroceryItemEntity>> getGroceryById(String id) async {
    if (await networkInfo.isConnected) {
    try {
      final grocery = await remoteDataSource.fetchGroceryById(id);
      return Right(grocery.toEntity());
    } catch (e) {
      return Left(ServerFailure("failed to fetch"));
    }
  }
  else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

}
