import 'package:bloc/bloc.dart';
import 'package:groceryapp/features/domain/usecases/get_groceries_usecase.dart';
import 'package:groceryapp/features/domain/usecases/get_grocry_by_id_usecase.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_event.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_state.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/usecase/usecase.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetGroceriesUseCase getGrocerysUsecase;
  final GetGroceryByIdUsecase getGroceryByIdUsecase;

  GroceryBloc({
    required this.getGrocerysUsecase,
    required this.getGroceryByIdUsecase,
  }) : super(GroceryInitial()) {
    on<LoadGroceryEvent>((event, emit) async {
      emit(GroceryLoading());
      final result = await getGrocerysUsecase.call(NoParams());
      result.fold((failure) => emit(GroceryError(message: 'falied to Load')),
          (_groceries) {
        Urls.allGrocery = _groceries;
        emit(GroceryLoaded(groceries: _groceries));
      });
    });

    on<FilteredGroceryEvent>(
      (event, emit) async {
        final filteredGrocery = Urls.allGrocery.where((grocery) {
          final String searchQuery = event.text.toLowerCase();
          return grocery.title.toLowerCase().contains(searchQuery);
        }).toList();
        emit(GroceryLoaded(groceries: filteredGrocery));
      },
    );
    on<GetGroceryByIdEvent>((event, emit) async {
      emit(GroceryLoading());
      final result = await getGroceryByIdUsecase(GetParams(id: event.id));
      result.fold(
        (failure) => emit(GroceryError(message: 'Failed to load')),
        (grocery) => emit(GroceryLoadedSingle(grocery: grocery)),
      );
    });
  }
}
