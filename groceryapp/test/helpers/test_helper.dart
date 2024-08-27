import 'package:groceryapp/core/usecase/usecase.dart';
import 'package:groceryapp/features/data/datasources/grocery_remote_data_source.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';
import 'package:groceryapp/features/domain/usecases/get_groceries_usecase.dart';
import 'package:groceryapp/features/domain/usecases/get_grocry_by_id_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';


@GenerateMocks([
  GroceryRepository,
  GroceryRemoteDataSource,
  Usecase,
  GetGroceriesUseCase,
  GetGroceryByIdUsecase,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
