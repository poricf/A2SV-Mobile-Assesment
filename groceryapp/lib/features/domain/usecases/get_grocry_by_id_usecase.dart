import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/core/usecase/usecase.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';

class GetGroceryByIdUsecase implements Usecase<Grocery, GetParams> {
  final GroceryRepository groceryRepository;

  GetGroceryByIdUsecase({required this.groceryRepository});

  @override
  Future<Either<Failure, Grocery>> call(GetParams params) async {
    return await groceryRepository.getGrocery(params.id);
  }
}

class GetParams extends Equatable {
  final String id;

  GetParams({required this.id});

  @override
  List<Object?> get props => [id];
}
