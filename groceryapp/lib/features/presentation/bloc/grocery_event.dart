import 'package:equatable/equatable.dart';

abstract class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object?> get props => [];
}

class LoadGroceryEvent extends GroceryEvent {}

class GetGroceryByIdEvent extends GroceryEvent {
  final String id;
  const GetGroceryByIdEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class FilteredGroceryEvent extends GroceryEvent {
  final String text;

  const FilteredGroceryEvent({required this.text});
}
