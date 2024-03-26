import 'package:flutter/material.dart';
import 'package:storywondermobile/character_info/name.dart';
import '../appbar/customappbar.dart';
import 'package:iconsax/iconsax.dart';

class CharacterLanch extends StatefulWidget {
  const CharacterLanch({super.key});

  @override
  State<CharacterLanch> createState() => _CharacterLanchState();
}

class _CharacterLanchState extends State<CharacterLanch>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/back.png',
                fit: BoxFit.cover,
              ),
            ),
            // Content
            const CustomAppBar(
              progress: 0.15,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Center(
                    child: Text(
                      'Welcome! \nThe magic is calling. Just a few questions stand in your way!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'comic',
                        fontSize: 23,
                        color: Color.fromARGB(202, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 50, // Adjust the height as desired
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharacterName(
                      // childName: _nameController.text,
                      ),
                ),
              );
            },
            label: const Row(
              children: [
                Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'comic',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Iconsax.next5,
                  color: Colors.white,
                ),
              ],
            ),
            backgroundColor: Colors.blue, // Always set to blue
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  12), // Adjust the border radius as desired
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
