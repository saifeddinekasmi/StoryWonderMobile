import 'package:flutter/material.dart';
import 'mypage.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF043743), // Set the background color to black
      body: SafeArea(
        child: Center(
          // Wrap the Column with Center
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Change to MainAxisAlignment.spaceBetween
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Image.asset(
                    'assets/images/logo_story_wonder.png',
                    width: 177,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'let\'s find the magic',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Schyler',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 60), // Set top padding to 60 pixels
                child: SizedBox(
                  width: 200, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WebViewPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Color(0xFF1F72C0),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 255, 255),
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
