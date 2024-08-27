import 'package:equatable/equatable.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<Grocery> groceries;

  const GroceryLoaded({required this.groceries});

  @override
  List<Object> get props => [groceries];
}

class GroceryError extends GroceryState {
  final String message;

  const GroceryError({required this.message});

  @override
  List<Object> get props => [message];
}

class GroceryLoadedSingle extends GroceryState {
  final Grocery grocery;

  const GroceryLoadedSingle({required this.grocery});

  @override
  List<Object> get props => [grocery];
}
