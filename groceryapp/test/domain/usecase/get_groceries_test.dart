import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/core/usecase/usecase.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/entities/options_entity.dart';

import 'package:groceryapp/features/domain/usecases/get_groceries_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetGroceriesUseCase getGroceriesUseCase;
  late MockGroceryRepository mockGroceryRepository;

  setUp(() {
    mockGroceryRepository = MockGroceryRepository();
    getGroceriesUseCase =
        GetGroceriesUseCase(groceryRepository: mockGroceryRepository);
  });

  final testProductDetails = [
    Grocery(
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
    ),
  ];

  test('should get all Grocery from the repository', () async {
    // arrange
    when(mockGroceryRepository.getGroceries())
        .thenAnswer((_) async => Right(testProductDetails));
    // act
    final result = await getGroceriesUseCase.call(NoParams());
    // assert
    expect(result, Right(testProductDetails));
    verify(mockGroceryRepository.getGroceries());
    verifyNoMoreInteractions(mockGroceryRepository);
  });

  test('should return a failure whent Grocery Fetching fails', () async {
    // arrange
    when(mockGroceryRepository.getGroceries()).thenAnswer(
        (_) async => Left(ServerFailure(message: 'Server Failure')));
    // act
    final result = await getGroceriesUseCase.call(NoParams());
    // assert
    expect(result, Left(ServerFailure(message: 'Server Failure')));
    verify(mockGroceryRepository.getGroceries());
    verifyNoMoreInteractions(mockGroceryRepository);
  });
}
