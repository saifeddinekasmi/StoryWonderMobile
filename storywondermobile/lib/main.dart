import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              top: 110, // Adjust the top position as needed
              left: 280, // Adjust the left position as needed
              child: AnimatedSticker(),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
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
    );
  }
}

class AnimatedSticker extends StatefulWidget {
  const AnimatedSticker({Key? key}) : super(key: key);

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
