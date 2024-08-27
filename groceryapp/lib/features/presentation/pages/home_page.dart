import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_bloc.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_event.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_state.dart';
import 'package:groceryapp/features/presentation/widgets/grocery_card.dart';
import 'package:groceryapp/features/presentation/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch products when the widget is initialized
    context.read<GroceryBloc>().add(LoadGroceryEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double paddingValue = screenSize.width * 0.05;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            children: [
              AppBar(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/food.png'),
                      width: 30,
                      height: 30,
                      fit: BoxFit.scaleDown,
                      alignment: FractionalOffset.center,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Burger',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [searchBar()],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (context, state) {
                    if (state is GroceryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GroceryLoaded) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenSize.width > 600 ? 4 : 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery = state.groceries[index];
                          return GroceryCard(
                            imageUrl: grocery.imageUrl,
                            foodName: grocery.title,
                            rating: grocery.rating,
                            oldPrice: grocery.price,
                            newPrice: grocery.discount,
                            description: grocery.description,
                          );
                        },
                      );
                    } else if (state is GroceryError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
