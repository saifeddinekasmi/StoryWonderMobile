import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class CharacterOne extends StatefulWidget {
  const CharacterOne({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterOneState createState() => _CharacterOneState();
}

class _CharacterOneState extends State<CharacterOne> {
  int selectIndex = 0;
  bool isSwitched  = false;

  void changeIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Widget customRadio(String txt, IconData iconData, int index) {
    return OutlinedButton(
      onPressed: () {
        changeIndex(index);
      },
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
          color: selectIndex == index ? Colors.blue : Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: selectIndex == index ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            txt,
            style: TextStyle(
                color: selectIndex == index ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  void _navigateBottomBar(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/back.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            drawerEnableOpenDragGesture: false,
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 4,
              title: const Text(
                'C R E A T E',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // appBar: AppBar(
            //   title: const Text(
            //     'Create Character',
            //     style: TextStyle(fontFamily: 'comic', color: Colors.white),
            //   ),
            //   backgroundColor: const Color(0xFF200C2C),
            //   iconTheme: const IconThemeData(
            //     color: Colors.white,
            //   ),
            // ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Character Description',
                            style: TextStyle(
                              fontFamily: 'comic',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Age',
                                      border: OutlineInputBorder()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Choice 2',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Choice 1',
                                child: Text('Choice 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Choice 2',
                                child: Text('Choice 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Choice 3',
                                child: Text('Choice 3'),
                              ),
                            ],
                            onChanged: (value) {
                              // Handle dropdown value change
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Choice 1',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Choice 1',
                                      child: Text('Choice 1'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Choice 2',
                                      child: Text('Choice 2'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Choice 3',
                                      child: Text('Choice 3'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    // Handle dropdown value change
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Choice 2',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Choice 1',
                                      child: Text('Choice 1'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Choice 2',
                                      child: Text('Choice 2'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Choice 3',
                                      child: Text('Choice 3'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    // Handle dropdown value change
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Choice 2',
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Choice 1',
                                child: Text('Choice 1'),
                              ),
                              DropdownMenuItem(
                                value: 'Choice 2',
                                child: Text('Choice 2'),
                              ),
                              DropdownMenuItem(
                                value: 'Choice 3',
                                child: Text('Choice 3'),
                              ),
                            ],
                            onChanged: (value) {
                              // Handle dropdown value change
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'What is the character gender ?',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'comic',
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              customRadio('Female', Icons.female, 0),
                              customRadio('Male', Icons.male, 1),
                            ],
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            'Does the character wear glasses ?',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'comic',
                                color: Colors.white),
                          ),
                          Switch(value: isSwitched, onChanged: (value){
                            setState(() {
                              isSwitched = value;
                            });
                          }),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Container(
                              width: 150, // Adjust the width as desired
                              height: 50, // Adjust the height as desired
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF00AEFF),
                                    Color(0xFF0076FF)
                                  ], // Customize the gradient colors
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(
                                    9), // Adjust the border radius as desired
                              ),
                              child: const Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: GNav(
                  color: Colors.black,
                  activeColor: Colors.black,
                  backgroundColor: Colors.white,
                  tabBackgroundColor: Color.fromARGB(255, 136, 136, 136),
                  padding: EdgeInsets.all(16),
                  gap: 10,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.generating_tokens,
                      text: 'Generate story',
                    ),
                    GButton(
                      icon: Icons.create,
                      text: 'Create Character',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'My Profile',
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   elevation: 0,
            //   currentIndex: _selectedIndex,
            //   onTap: _navigateBottomBar,
            //   backgroundColor: const Color.fromARGB(255, 34, 34, 34),
            //   items: const [
            //     BottomNavigationBarItem(
            //       icon: Icon(Iconsax.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.generating_tokens),
            //       label: 'Generate Story',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person_3),
            //       label: 'My Profile',
            //     ),
            //   ],
            //   selectedItemColor: const Color.fromARGB(
            //       255, 201, 24, 127), // Customize the selected item color
            //   unselectedItemColor: const Color.fromARGB(
            //       255, 255, 255, 255), // Customize the unselected item color
            //   selectedLabelStyle: const TextStyle(
            //       fontWeight: FontWeight
            //           .bold), // Customize the selected label font style
            //   unselectedLabelStyle: const TextStyle(
            //       fontWeight: FontWeight
            //           .normal), // Customize the unselected label font style
            // ),
          ),
        ],
      ),
    );
  }
}
