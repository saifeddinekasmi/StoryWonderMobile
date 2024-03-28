import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storywondermobile/character_info/lanch.dart';
import '../generate_stroy.dart';

import '../appbar/customappbar.dart';

class CharacterGreat extends StatefulWidget {
  // final String childName;
  const CharacterGreat({
    super.key,
  });
  @override
  State<CharacterGreat> createState() => _CharacterGreatState();
}

class _CharacterGreatState extends State<CharacterGreat>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  int selectIndex = 0;
  bool isSwitched = false;

  get ssa => null;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkButtonEnable);
  }

  void _checkButtonEnable() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return SizedBox(
      height: 50,
      width: double.infinity, // Set width to full width
      child: OutlinedButton(
        onPressed: () {
          if (selectIndex != index) {
            changeIndex(index);
          }
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90.0),
          ),
          side: BorderSide(
            width: 2,
            color: selectIndex == index ? Colors.blue : Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: TextStyle(
                color: selectIndex == index ? Colors.blue : Colors.grey,
                fontFamily: 'comic',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                'assets/images/back.png', // Replace 'background.jpg' with your image path
                fit: BoxFit.cover,
              ),
            ),
            // Content

            const CustomAppBar(
              progress: 0.85,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Greaaaat !!',
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontSize: 35,
                              color: Colors.white),
                        ),
                      )),
                      Expanded(
                        child: SizedBox(
                          height: 200, // Adjust the height as desired
                          child: Image.asset(
                            'assets/images/fun.gif', // Replace 'background.jpg' with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
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
                  builder: (context) => SettingsPage(
                    key: ssa,
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
