import 'package:flutter/material.dart';
import 'age.dart';
import '../appbar/customappbar.dart';
import 'package:iconsax/iconsax.dart';

class CharacterName extends StatefulWidget {
  const CharacterName({super.key});

  @override
  State<CharacterName> createState() => _CharacterNameState();
}

class _CharacterNameState extends State<CharacterName>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkButtonEnable);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _checkButtonEnable() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty;
    });
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
            Column(
              children: [
                const CustomAppBar(
                  progress: 0.3,
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
                          child: Image.asset('assets/images/1.png'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'What is your child name?',
                            style: TextStyle(
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'We will never share your child information!!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'comic',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -
                        50, // Adjust the width as needed
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'comic',
                        fontSize: 20,
                      ),
                      controller: _nameController,
                      cursorColor: const Color(0xFF11BFDD),
                      cursorOpacityAnimates: true,
                      cursorRadius: const Radius.circular(10),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: '  ex. Kevin',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(66, 255, 255, 255),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF11BFDD),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 20),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         Center(
                //           child: SizedBox(
                //             width: 180, // Adjust the width as needed
                //             height: 50, // Adjust the height as needed
                //             child: ElevatedButton(
                //               style: ButtonStyle(
                //                 backgroundColor:
                //                     MaterialStateProperty.resolveWith<Color>(
                //                   (Set<MaterialState> states) {
                //                     if (states
                //                         .contains(MaterialState.disabled)) {
                //                       return const Color.fromARGB(137, 158, 158,
                //                           158);
                //                     }
                //                     return Colors
                //                         .blue;
                //                   },
                //                 ),
                //                 shape: MaterialStateProperty.all<
                //                     RoundedRectangleBorder>(
                //                   RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(50.0),
                //                   ),
                //                 ),
                //               ),
                //               onPressed: _isButtonEnabled
                //                   ? () {
                //                       Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                           builder: (context) => CharacterAge(
                //                             childName: _nameController.text,
                //                           ),
                //                         ),
                //                       );
                //                     }
                //                   : null,
                //               child: const Text(
                //                 'Continue',
                //                 style: TextStyle(
                //                   fontFamily: 'comic',
                //                   color: Colors.white,
                //                   fontSize: 18,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
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
                        builder: (context) => CharacterAge(
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
