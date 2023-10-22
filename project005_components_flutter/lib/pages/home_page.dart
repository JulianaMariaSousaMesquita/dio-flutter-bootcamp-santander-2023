import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;

  void _generateRandomNumber() {
    Random randomNumber = Random();
    setState(() {
      generatedNumber = randomNumber.nextInt(1000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Components - Flutter")),
      ),
      body: Center(child: Text(generatedNumber.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomNumber,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
