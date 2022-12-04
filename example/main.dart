import 'package:flutter/material.dart';
import 'package:lens_spinner/lens_spinner.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: LensSpinner(
            width: 400,
          ),
        ),
      ),
    );
  }
}
