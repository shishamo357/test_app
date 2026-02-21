import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorChangePage(),
    );
  }
}

class ColorChangePage extends StatefulWidget {
  const ColorChangePage({super.key});

  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: bgColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                bgColor = Color.fromARGB(
                  255,
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                );
              });
            },
            child: const Text("Change"),
          ),
        ),
      ),
    );
  }
}

