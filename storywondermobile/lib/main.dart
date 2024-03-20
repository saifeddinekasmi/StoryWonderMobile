// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:storywondermobile/onboarding_screen.dart';


void main() => runApp(const MaterialApp(
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcome2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 110,
                left: 280,
                child: AnimatedSticker(),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingScreen()),
                      );
                    },
                    child: const Text(
                      'Unleash Magic',
                      style: TextStyle(
                        color: Color.fromARGB(255, 112, 19, 210),
                        // Add other text style properties here
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSticker extends StatefulWidget {
  const AnimatedSticker({super.key});

  @override
  _AnimatedStickerState createState() => _AnimatedStickerState();
}

class _AnimatedStickerState extends State<AnimatedSticker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Reverse the animation for up and down motion
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset:
              Offset(1, _controller.value * 8), // Move up and down by 10 pixels
          child: Image.asset(
            "assets/images/astronaut.png", // Replace with your sticker image path // Adjust sticker width as needed
            height: 65, // Adjust sticker height as needed
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
