import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/shield.png',
                // fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hi there!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'comic',
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Welcome to StoryWonder,\n\n'
                  'Ready to embark on adventures,\n'
                  'dreams, and discoveries.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'comic', color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
