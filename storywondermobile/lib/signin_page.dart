import 'package:flutter/material.dart';
import 'CharacterInfo/create_character_1.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              // Existing content
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/shield.png',
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Hi there!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'myfont',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(97, 2, 2, 2),
                      borderRadius: BorderRadius.all(
                          Radius.circular(30.0)), // Border radius
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Welcome to StoryWonder,\n\n'
                        'Ready to embark on adventures,\n'
                        'dreams, and discoveries.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'myfont',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              // Positioned button with Row
              Positioned(
                bottom: 70.0,
                left: 80.0, // Adjust left and right paddings as needed
                right: 80.0, // Adjust left and right paddings as needed

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
                          MaterialPageRoute(
                              builder: (context) => const CharacterOne()),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 255, 255, 255),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/google.png', // Replace with the actual path to your logo image
                                width: 30, // Adjust the width as needed
                                // height: 24, // Adjust the height as needed
                                // Adjust the color as needed
                              ),
                              const Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontFamily: 'myfont',
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
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
