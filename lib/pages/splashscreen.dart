import 'package:flutter/material.dart';
import 'dart:async'; // Para simular o delay do splash
import 'package:galaxyfy_application/shared/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Configuring the animation
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -200), // Adjust the value for the desired position
    ).animate(_controller);

    _controller.forward(); // Start the animation

    // Simulating time to exit the splash screen
    Timer(const Duration(seconds: 2), () {
      _controller.reverse();
    });

    Timer(const Duration(seconds: 3), () {
      _controller.forward();
    });

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fundo.png'), // Path to the background image
            fit: BoxFit.cover, // Make the image cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Astronaut image
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      'assets/img/astronauta.png', // Replace with the correct path to your image
                      height: 150, // Adjust as needed
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), // Space between image and text

              // Text "Galaxy Fy"
              Text(
                'GalaxyFy',
                style: TextStyle(
                  fontFamily: MyFonts.fontPrimary, // Font family
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}