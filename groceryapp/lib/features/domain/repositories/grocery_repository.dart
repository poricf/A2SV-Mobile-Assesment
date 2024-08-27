import 'package:dartz/dartz.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';

abstract class GroceryRepository {
  Future<Either<Failure, List<Grocery>>> getGroceries();
  Future<Either<Failure, Grocery>> getGrocery(String id);
}
