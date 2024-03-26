import 'package:flutter/material.dart';
import '../appbar/customappbar.dart';
import 'ethnicity.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:flutter/services.dart' show precacheImage;

class CharacterAge extends StatefulWidget {
  final String childName;
  const CharacterAge({super.key, required this.childName});

  @override
  State<CharacterAge> createState() => _CharacterAgeState();
}

class _CharacterAgeState extends State<CharacterAge>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();

  int selectIndex = 0;
  bool _isButtonEnabled = false;
  int selectedRadioIndex = 0;
  bool isSwitched = false;

  void handleRadioSelection(int index) {
    setState(() {
      selectedRadioIndex = index;
      _isButtonEnabled =
          true; // Enable the button when a radio button is selected
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkButtonEnable);
  }

  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void _checkButtonEnable() {
    setState(() {
      // ignore: unnecessary_null_comparison
      _isButtonEnabled = selectIndex != null;
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
                      progress: 0.45,
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
                              child: Image.asset('assets/images/2.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'How old is ${widget.childName}?',
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
                        'age-tailored content for your child. if you ave more than one, you can add the later.',
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
                            customRadio('1-2', 0, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio('3-4', 1, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio('5-6', 2, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio('7-8', 3, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio('9-10', 4, handleRadioSelection),
                            const SizedBox(height: 10),
                            customRadio('11++', 5, handleRadioSelection),
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
            onPressed: _isButtonEnabled
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterEthnicity(
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
            backgroundColor: _isButtonEnabled ? Colors.blue : Colors.grey,
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
