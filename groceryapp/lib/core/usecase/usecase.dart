import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:groceryapp/core/failure/failure.dart';

abstract class Usecase<Type, params> {
  Future<Either<Failure, Type>> call(params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
