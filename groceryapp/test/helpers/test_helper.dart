import 'package:groceryapp/core/platform/network_info.dart';
import 'package:groceryapp/core/usecase/usecase.dart';
import 'package:groceryapp/features/data/datasources/grocery_remote_data_source.dart';
import 'package:groceryapp/features/data/datasources/local_data_source.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';
import 'package:groceryapp/features/domain/usecases/get_groceries_usecase.dart';
import 'package:groceryapp/features/domain/usecases/get_grocry_by_id_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';


@GenerateMocks([
  GroceryRepository,
  GroceryRemoteDataSource,
  Usecase,
  GetGroceriesUseCase,
  GetGroceryByIdUsecase,
  GroceryLocalDataSource,
  NetworkInfo,
  InternetConnectionChecker,
  SharedPreferences,
  
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
