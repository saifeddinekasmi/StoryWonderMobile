import 'package:flutter/material.dart';

class StoryGenerate extends StatefulWidget {
  const StoryGenerate({super.key});

  @override
  State<StoryGenerate> createState() => _StoryGenerateState();
}

class _StoryGenerateState extends State<StoryGenerate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('S T O R Y'),
        ),
        body: SafeArea(
          child: Container(
            // Your content goes here
          ),
        ),
      ),
    );
  }
}