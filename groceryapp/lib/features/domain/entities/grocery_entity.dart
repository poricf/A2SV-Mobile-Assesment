import 'package:equatable/equatable.dart';

import 'options_entity.dart';

class Grocery extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final num rating;
  final num price;
  final num discount;
  final String description;
  final List<OptionEntity> options;

  var foodName;

  Grocery({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        rating,
        price,
        discount,
        description,
        options,
      ];
}
