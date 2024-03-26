
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import '../create_story.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double progress;
//   final Function onBackButtonPressed;

//   const CustomAppBar({super.key, 
//     required this.progress,
//     required this.onBackButtonPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () => onBackButtonPressed(),
//       ),
//       title: const Text(
//         'Your App Title',
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(6),
//         child: LinearProgressIndicator(
//           value: progress,
//           backgroundColor: Colors.grey[200],
//           valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 6);
// }

// class CharacterOne extends StatefulWidget {
//   const CharacterOne({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _CharacterOneState createState() => _CharacterOneState();
// }

// String? selectedAge = 'ex. 2';
// List<String> ageChoices = [
//   '2',
//   '3',
//   '4',
//   '5',
//   '6',
//   '7',
//   '8',
//   '9',
//   '10',
//   '11',
//   '12',
// ];
// FocusNode nameFocusNode = FocusNode();

// String? value;

// class _CharacterOneState extends State<CharacterOne> {
//   int selectIndex = 0;
//   bool isSwitched = false;

//   void changeIndex(int index) {
//     setState(() {
//       selectIndex = index;
//     });
//   }

//   Widget customRadio(String txt, IconData iconData, int index) {
//     return Row(
//       children: [
//         OutlinedButton(
//           onPressed: () {
//             changeIndex(index);
//           },
//           style: OutlinedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)),
//             side: BorderSide(
//               color: selectIndex == index ? Colors.blue : Colors.grey,
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 iconData,
//                 color: selectIndex == index ? Colors.blue : Colors.grey,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 txt,
//                 style: TextStyle(
//                   color: selectIndex == index ? Colors.blue : Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 16),
//       ],
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         // '/home': (context) => HomePage(),
//         '/generate': (context) => const StoryGenerate(),
//         // '/create': (context) => CreateCharacterPage(),
//         // '/profile': (context) => MyProfilePage(),
//       },
//       home: SafeArea(
//         child: Stack(
//           children: [
//             Scaffold(
//                 backgroundColor: const Color(0xFF200C2C),
//                 drawerEnableOpenDragGesture: false,
//                 appBar: CustomAppBar(
//                   progress: 0.5,
//                   onBackButtonPressed: () {
                    
//                   },
//                 ),
//                 body: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   'Character Description',
//                                   style: TextStyle(
//                                     fontFamily: 'myfont',
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: SizedBox(
//                                         height: 50,
//                                         child: TextField(
//                                           cursorColor: Colors.white,
//                                           cursorOpacityAnimates: true,
//                                           style: const TextStyle(
//                                               color: Colors.white),
//                                           decoration: InputDecoration(
//                                             labelText: 'Name',
//                                             labelStyle: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: nameFocusNode.hasFocus
//                                                     ? 20
//                                                     : 17,
//                                                 fontFamily:
//                                                     'comic' // Adjust the font sizes as needed
//                                                 ),
//                                             hintText: 'ex. Kevin',
//                                             hintStyle: const TextStyle(
//                                               color: Color.fromARGB(
//                                                   66, 255, 255, 255),
//                                             ),
//                                             border: const OutlineInputBorder(),
//                                           ),
//                                           focusNode: nameFocusNode,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Expanded(
//                                       child: SizedBox(
//                                         height: 50,
//                                         child: DropdownButtonFormField<String>(
//                                           value: value,
//                                           onChanged: (newValue) {
//                                             setState(() {
//                                               value = newValue;
//                                             });
//                                           },
//                                           style: const TextStyle(
//                                               color: Colors
//                                                   .white), // Dropdown menu style
//                                           dropdownColor: Colors
//                                               .black, // Set the color of the dropdown menu
//                                           items: ageChoices.map((String age) {
//                                             return DropdownMenuItem<String>(
//                                               value: age,
//                                               child: Text(
//                                                 age,
//                                                 style: TextStyle(
//                                                   color: value == age
//                                                       ? Colors.white
//                                                       : const Color.fromARGB(
//                                                           255, 255, 255, 255),
//                                                 ),
//                                               ),
//                                             );
//                                           }).toList(),
//                                           decoration: const InputDecoration(
//                                             labelText: 'Age',
//                                             labelStyle:
//                                                 TextStyle(color: Colors.white),
//                                             border: OutlineInputBorder(),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 16),
//                                 const Text(
//                                   'What is the character Ethnicity ?',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: 'comic',
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 DropdownButtonFormField<String>(
//                                   decoration: const InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     hintText: 'African, Asian, ...',
//                                     hintStyle: TextStyle(
//                                       color: Color.fromARGB(66, 255, 255, 255),
//                                     ),
//                                   ),
//                                   style: const TextStyle(
//                                       fontFamily: 'comic',
//                                       fontSize: 16,
//                                       color: Color.fromARGB(255, 255, 255,
//                                           255)), // Customize the dropdown button text color
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: 'African',
//                                       child: Text('African'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Asian',
//                                       child: Text('Asian'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Caucasian',
//                                       child: Text('Caucasian'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Hispanic / Latino',
//                                       child: Text('Hispanic / Latino'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Middle Eastern',
//                                       child: Text('Middle Eastern'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Native American',
//                                       child: Text('Native American'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Mixed Ethnicity / Multiracial',
//                                       child:
//                                           Text('Mixed Ethnicity / Multiracial'),
//                                     ),
//                                   ],
//                                   onChanged: (value) {
//                                     // Handle dropdown value change
//                                   },
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox(
//                                       width:
//                                           150, // Set a specific width for the container
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Hair Style',
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontFamily: 'comic',
//                                                 color: Colors.white),
//                                           ),
//                                           const SizedBox(height: 4),
//                                           DropdownButtonFormField<String>(
//                                             decoration: const InputDecoration(
//                                               hintText: 'Shorte, long, ...',
//                                               hintStyle: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 255, 255, 255),
//                                               ),
//                                               border: OutlineInputBorder(),
//                                             ),
//                                             items: const [
//                                               DropdownMenuItem(
//                                                 value: 'Short',
//                                                 child: Text('Short'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Long',
//                                                 child: Text('Long'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Curly',
//                                                 child: Text('Curly'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Straight',
//                                                 child: Text('Straight'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Wavy',
//                                                 child: Text('Wavy'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Bald',
//                                                 child: Text('Bald'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Ponytail',
//                                                 child: Text('Ponytail'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Braided',
//                                                 child: Text('Braided'),
//                                               ),
//                                             ],
//                                             onChanged: (value) {
//                                               // Handle dropdown value change
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(width: 16),
//                                     SizedBox(
//                                       width:
//                                           150, // Set a specific width for the container
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Text(
//                                             'Hair Color',
//                                             style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontFamily: 'comic',
//                                                 color: Colors.white),
//                                           ),
//                                           const SizedBox(height: 4),
//                                           DropdownButtonFormField<String>(
//                                             decoration: const InputDecoration(
//                                               hintText: 'Black, Brown, ...',
//                                               hintStyle: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     66, 255, 255, 255),
//                                               ),
//                                               border: OutlineInputBorder(),
//                                             ),
//                                             items: const [
//                                               DropdownMenuItem(
//                                                 value: 'Black',
//                                                 child: Text('Black'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Brown',
//                                                 child: Text('Brown'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Blonde',
//                                                 child: Text('Blonde'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Gray',
//                                                 child: Text('Gray'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'Red',
//                                                 child: Text('Red'),
//                                               ),
//                                               DropdownMenuItem(
//                                                 value: 'White',
//                                                 child: Text('White'),
//                                               ),
//                                             ],
//                                             onChanged: (value) {
//                                               // Handle dropdown value change
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 16),
//                                 const Text(
//                                   'What is the character Ethnicity ?',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: 'comic',
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 DropdownButtonFormField<String>(
//                                   decoration: const InputDecoration(
//                                     hintText: 'Brown, Blue, ...',
//                                     hintStyle: TextStyle(
//                                       color: Color.fromARGB(66, 255, 255, 255),
//                                     ),
//                                     border: OutlineInputBorder(),
//                                   ),
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: 'Brown',
//                                       child: Text('Brown'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Blue',
//                                       child: Text('Blue'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Hazel',
//                                       child: Text('Hazel'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Green',
//                                       child: Text('Green'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Gray',
//                                       child: Text('Gray'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'Amber',
//                                       child: Text('Amber'),
//                                     ),
//                                   ],
//                                   onChanged: (value) {
//                                     // Handle dropdown value change
//                                   },
//                                 ),
//                                 const SizedBox(height: 16),
//                                 const Text(
//                                   'What is the character gender ?',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: 'comic',
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         customRadio('Female', Icons.female, 0),
//                                       ],
//                                     ),
//                                     // Replace Spacer with SizedBox(width: 0)
//                                     Column(
//                                       children: [
//                                         customRadio('Male', Icons.male, 1),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 3),
//                                 const Text(
//                                   'Does the character wear glasses ?',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: 'comic',
//                                       color: Colors.white),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     // Logo widget goes here
//                                     SizedBox(
//                                       // width: 35, // Adjust the width as needed
//                                       height: 35, // Adjust the height as needed
//                                       child: Image.asset(
//                                           'assets/images/Glasses.png'),
//                                     ),
//                                     const SizedBox(width: 5),
//                                     CupertinoSwitch(
//                                       value: isSwitched,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           isSwitched = value;
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Handle button press
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                   child: Ink(
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFF932F6A),
//                                       borderRadius: BorderRadius.circular(
//                                           50), // Adjust the border radius as desired
//                                     ),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xFF932F6A),
//                                         borderRadius: BorderRadius.circular(
//                                             50), // Adjust the border radius as desired
//                                       ),
//                                       width: 150, // Adjust the width as desired
//                                       height:
//                                           50, // Adjust the height as desired
//                                       alignment: Alignment.center,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           const Text(
//                                             '  Save',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                               width:
//                                                   5), // Adjust the spacing between the text and logo
//                                           Image.asset(
//                                             'assets/images/send.png', // Replace with the path to your logo image
//                                             width:
//                                                 20, // Adjust the width of the logo image
//                                             height:
//                                                 20, // Adjust the height of the logo image
//                                             color: const Color(
//                                                 0xFFFFFFFF), // Customize the color of the logo image
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 bottomNavigationBar: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   child: Container(
//                     color: const Color(0xFF2E1645),
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//                       child: GNav(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         activeColor: Color.fromARGB(255, 255, 255, 255),
//                         backgroundColor: Color(0xFF2E1645),
//                         padding: EdgeInsets.all(16),
//                         gap: 10,
//                         tabs: [
//                           GButton(
//                             icon: Icons.home,
//                             text: 'Home',
//                           ),
//                           GButton(
//                             icon: Icons.generating_tokens,
//                             text: 'Generate story',
//                           ),
//                           GButton(
//                             icon: Icons.create,
//                             text: 'Create Character',
//                           ),
//                           GButton(
//                             icon: Icons.person,
//                             text: 'My Profile',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
