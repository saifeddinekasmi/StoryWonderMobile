import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatefulWidget {
  // final String childName;
  const SettingsPage({
    super.key,
  });
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  int selectIndex = 0;
  bool isSwitched = false;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Scaffold(
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
            AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                color: Colors.blue,
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () {
                  // Handle back button press
                },
              ),
              title: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Generate your story',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'comic',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hello',
                  style: TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 50,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            label: const Row(
              children: [
                Text(
                  'Generate',
                  style: TextStyle(
                    fontFamily: 'comic',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Iconsax.star5,
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
