import 'package:dartz/dartz.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';

class GroceryRepoImplementation implements GroceryRepository {
  @override
  Future<Either<Failure, List<Grocery>>> getGroceries() {
    // TODO: implement getGroceries
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Grocery>> getGrocery(String id) {
    // TODO: implement getGrocery
    throw UnimplementedError();
  }
}
