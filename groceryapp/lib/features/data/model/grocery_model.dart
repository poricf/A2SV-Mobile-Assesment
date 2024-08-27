import 'package:groceryapp/features/domain/entities/grocery_entity.dart';

class GroceryModel extends Grocery {
  GroceryModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.rating,
    required super.price,
    required super.discount,
    required super.description,
    required super.options,
  });

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    try {
      return GroceryModel(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        rating: json['rating'],
        price: json['price'],
        discount: json['discount'],
        description: json['description'],
        options: json['options'],
      );
    } catch (e) {
      throw Exception('Error parsing JSON (GroceryModel.fromJson)$e ');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options,
    };
  }

  static Grocery toEntity(GroceryModel model) {
    return Grocery(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      rating: model.rating,
      price: model.price,
      discount: model.discount,
      description: model.description,
      options: model.options,
    );
  }

  static List<Grocery> toEntities(List<GroceryModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static GroceryModel toModel(Grocery grocery) {
    return GroceryModel(
      id: grocery.id,
      title: grocery.title,
      imageUrl: grocery.imageUrl,
      rating: grocery.rating,
      price: grocery.price,
      discount: grocery.discount,
      description: grocery.description,
      options: grocery.options,
    );
  }

  //from json list
  static List<GroceryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GroceryModel.fromJson(json)).toList();
  }

  //to json list
  static List<Map<String, dynamic>> toJsonList(
      List<GroceryModel> groceryModels) {
    return groceryModels.map((groceryModel) => groceryModel.toJson()).toList();
  }
}
