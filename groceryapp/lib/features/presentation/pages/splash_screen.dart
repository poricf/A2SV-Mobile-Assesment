import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey[300]!,
                    child: Text('Welcome to',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22)),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.yellowAccent,
                    child: Text(
                      'SPEEDY CHOW',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
