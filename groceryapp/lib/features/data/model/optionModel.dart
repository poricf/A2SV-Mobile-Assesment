import 'package:equatable/equatable.dart';
import 'package:groceryapp/features/domain/entities/options_entity.dart';


class OptionModel extends OptionEntity {
  OptionModel({
    required String id,
    required String name,
    required num price,
  }) : super(id: id, name: name, price: price);

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
