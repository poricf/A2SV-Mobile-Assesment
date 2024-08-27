import 'package:dartz/dartz.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/core/usecase/usecase.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';

class GetGroceriesUseCase implements Usecase<List<Grocery>, NoParams> {
  final GroceryRepository groceryRepository;

  GetGroceriesUseCase({required this.groceryRepository});

  @override
  Future<Either<Failure, List<Grocery>>> call(NoParams params) async {
    return await groceryRepository.getGroceries();
  }
}
