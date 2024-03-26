import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storywondermobile/character_info/lanch.dart';

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
              Builder(
                builder: (context) {
                  final screenHeight = MediaQuery.of(context).size.height;
                  final screenWidth = MediaQuery.of(context).size.width;

                  return Positioned(
                    top: screenHeight * 0.14,
                    left: screenWidth * 0.72,
                    child: const AnimatedSticker(),
                  );
                },
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 50,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(50.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const CharacterLanch(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                            transitionDuration:
                                const Duration(milliseconds: 300),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3D1535),
                              Color(0xFF8A2D4C),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 19),
                          child: Row(
                            children: [
                              Text(
                                'Unleash Magic',
                                style: TextStyle(
                                  fontFamily: 'comic',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Iconsax.search_favorite,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
  // ignore: library_private_types_in_public_api
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
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(1, _controller.value * 8),
          child: Image.asset(
            "assets/images/astronaut.png",
            height: 65,
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
