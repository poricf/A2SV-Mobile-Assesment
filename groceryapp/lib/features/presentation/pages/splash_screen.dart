import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groceryapp/features/presentation/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    return Scaffold(
      body: Stack(
        children: [
          // Use BoxFit.cover to ensure the image covers the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
