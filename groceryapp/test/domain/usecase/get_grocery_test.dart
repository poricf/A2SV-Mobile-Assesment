import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/entities/options_entity.dart';
import 'package:groceryapp/features/domain/usecases/get_grocry_by_id_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetGroceryByIdUsecase getGroceryByIdUsecase;
  late MockGroceryRepository mockGroceryRepository;
  setUp(() {
    mockGroceryRepository = MockGroceryRepository();
    getGroceryByIdUsecase =
        GetGroceryByIdUsecase(groceryRepository: mockGroceryRepository);
  });

  final testGroceryDetails = Grocery(
    id: '1',
    title: 'Chicken Burger',
    description:
        'A delicious chicken burger served on a toasted bun with fresh lettuce.',
    price: 11,
    imageUrl: 'imageurl',
    rating: 4.9,
    discount: 6,
    options: [
      OptionEntity(id: 'o1', name: 'Add Cheese', price: 0.5),
      OptionEntity(id: 'o2', name: 'Add Bacon', price: 1),
      OptionEntity(id: 'o3', name: 'Add Meat', price: 0),
    ],
  );

  const testGroceryId = '1';
  test('should get Grocery by id from the repository', () async {
    // arrange
    when(mockGroceryRepository.getGrocery(testGroceryId))
        .thenAnswer((_) async => Right(testGroceryDetails));

    // act
    final result = await getGroceryByIdUsecase.call(GetParams(id: testGroceryId));

    // assert
    expect(result, Right(testGroceryDetails));
    verify(mockGroceryRepository.getGrocery(testGroceryId));
    verifyNoMoreInteractions(mockGroceryRepository);
    
  });
}
