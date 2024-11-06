import 'package:flutter/material.dart';
import 'dart:async';
import '../shared/style.dart'; 

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
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -200), // Adjust the value for the desired position
    ).animate(_controller);

    _controller.forward(); // Start the animation

    // Simulating time to exit the splash screen
    Timer(Duration(seconds: 3), () {
      _controller.reverse();
    });

    Timer(Duration(seconds: 4), () {
      _controller.forward();
    });

    Timer(Duration(seconds: 4), () {
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
              // Astronaut image with animation
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      'assets/img/astronalta.png', // Replace with the correct path to your image
                      height: 150, // Adjust as needed
                    ),
                  );
                },
              ),

              SizedBox(height: 20), // Space between image and text

              // "GalaxyFy" text
              Text(
                'GalaxyFy',
                style: TextStyle(
                  fontFamily: MyFonts.fontPrimary, // Font family
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // "Sua galáxia musical, personalizada para você" text
              Text(
                'Sua galáxia musical, personalizada para você',
                style: TextStyle(
                  fontFamily: MyFonts.fontPrimary, // Font family
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              // Added the "sound" GIF from assets/gif
              // GifView(
              //   // Replace 'sound.gif' with the actual filename in your assets/gif folder
              //   gif: AssetImage('assets/gif/sound.gif'),
              //   height: 50, // Adjust the height as needed
              //   width: 50, // Adjust the width as needed
              // ),
              Image.asset('assets/gif/gif_splash.gif')
            ],
          ),
        ),
      ),
    );
  }
}