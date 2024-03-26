import 'package:flutter/material.dart';
import 'package:storywondermobile/character_info/gender.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:vibrate/vibrate.dart';
import '../appbar/customappbar.dart';

class CharacterEthnicity extends StatefulWidget {
  final String childName;
  const CharacterEthnicity({super.key, required this.childName});
  @override
  State<CharacterEthnicity> createState() => _CharacterEthnicityState();
}

class _CharacterEthnicityState extends State<CharacterEthnicity>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  int selectIndex = 0;
  bool isSwitched = false;
  bool isButtonEnabled = false;
  int selectedRadioIndex = 0; // Add this variable to track the selected index

  void handleRadioSelection(int index) {
    setState(() {
      selectedRadioIndex = index;
      isButtonEnabled =
          true; // Enable the button when a radio button is selected
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkButtonEnable);
  }

  void _checkButtonEnable() {
    setState(() {
      // ignore: unnecessary_null_comparison
      isButtonEnabled = selectIndex != null;
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
    });
  }

  Widget customRadio(String txt, int index, Function(int) onSelect) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          if (selectIndex != index) {
            changeIndex(index);
            onSelect(
                index); // Call the onSelect callback with the selected index
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
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Set height to screen height
                child: Column(
                  children: [
                    const CustomAppBar(
                      progress: 0.60,
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
                              child: Image.asset('assets/images/3.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'What ethnicity is ${widget.childName}?',
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
                    const Padding(
                      padding: EdgeInsets.only(left: 35, right: 35),
                      child: Text(
                        'this ensure your child is displayed properly in the storis',
                        style:
                            TextStyle(fontFamily: 'comic', color: Colors.amber),
                        textAlign: TextAlign.center,
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
                            customRadio(
                                'test test/test', 0, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio(
                                'test test/test', 1, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio(
                                'test test/test', 2, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio(
                                'test test/test', 3, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio(
                                'test test/test', 4, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio(
                                'test test/test', 5, handleRadioSelection),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                        builder: (context) => CharacterGender(
                          childName: _nameController.text,
                        ),
                      ),
                    );
                  }
                : null,
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
            backgroundColor: isButtonEnabled ? Colors.blue : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  12), // Adjust the border radius as desired
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
