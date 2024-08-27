import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_bloc.dart';
import 'package:groceryapp/features/presentation/pages/Basket_page.dart';
import 'package:groceryapp/features/presentation/pages/details_page.dart';
import 'package:groceryapp/features/presentation/pages/home_page.dart';
import 'package:groceryapp/features/presentation/pages/splash_screen.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GroceryBloc(getGroceryByIdUsecase: sl(), getGrocerysUsecase: sl()),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _createRoute(const SplashScreen());

            case '/home':
              return _createRoute(HomePage());

            case '/Basket':
              return _createRoute(BasketPage());

            case '/detail':
              final args = settings.arguments as Grocery;
              return _createRoute(GroceryDetailsPage(
                imageUrl: args.imageUrl,
                foodName: args.title,
                rating: args.rating,
                oldPrice: args.discount,
                newPrice: args.price,
                description: args.description,
              ));
            default:
              return null;
          }
        },
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: const Color.fromARGB(255, 63, 81, 243),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 81, 243)),
          useMaterial3: true,
        ),
        // home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

PageRouteBuilder _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
