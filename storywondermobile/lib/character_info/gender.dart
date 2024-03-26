

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storywondermobile/character_info/done_page.dart';

import '../appbar/customappbar.dart';

class CharacterGender extends StatefulWidget {
  final String childName;
  const CharacterGender({super.key, required this.childName});
  @override
  State<CharacterGender> createState() => _CharacterGenderState();
}

class _CharacterGenderState extends State<CharacterGender>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  int selectIndex = 0;
  bool isSwitched = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkButtonEnable);
  }

  void _checkButtonEnable() {
    setState(() {
      isButtonEnabled = selectIndex >= 0;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
      isButtonEnabled =
          true; // Set isButtonEnabled to true when a gender is selected
    });
  }

  Widget customRadio(String txt, int index) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          changeIndex(index); // Call changeIndex method to update selectIndex
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
            SizedBox(
              height: MediaQuery.of(context)
                  .size
                  .height, // Set height to screen height
              child: Column(
                children: [
                  const CustomAppBar(
                    progress: 0.70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/4.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Is ${widget.childName} a boy or a girl?',
                              style: const TextStyle(
                                fontFamily: 'comic',
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: double.infinity, // Set width to full width
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30), // Add padding if needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Adjust alignment as needed
                        children: [
                          customRadio('Boy', 0),
                          const SizedBox(height: 10),
                          customRadio('Girl', 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 50, // Adjust the height as desired
          child: FloatingActionButton.extended(
            onPressed: isButtonEnabled
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CharacterGreat(
                            // childName: _nameController.text,
                            ),
                      ),
                    );
                  }
                : null,
            label: const Row(
              children: [
                Text(
                  'start the magic',
                  style: TextStyle(
                    fontFamily: 'comic',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Iconsax.magicpen4,
                  color: Colors.white,
                ),
              ],
            ),
            backgroundColor: isButtonEnabled ? Colors.blue : Colors.grey,
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
