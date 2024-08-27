

import 'package:groceryapp/features/domain/entities/grocery_entity.dart';

class Urls{
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';
  static String getGroceryById(String id) => '$baseUrl/$id';
  static List<Grocery> allGrocery = [];

}




