import 'package:flutter/material.dart';
import 'create_character_1.dart';

class OnboardingScreen extends StatelessWidget {
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
                        fontFamily: 'comic',
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
                          fontFamily: 'comic',
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
                  width: 250.0, // Set desired button width
                  height: 50.0, // Set desired button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CharacterOne()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF4F3F71), // Set button background color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Logo widget (replace with your logo image)
                        Image.asset('assets/images/google.png',
                            width: 30.0, height: 30.0),
                        const Text(
                          'Sign in with google',
                          style: TextStyle(
                              fontFamily: 'comic',
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
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
