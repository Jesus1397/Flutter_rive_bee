import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  unawaited(RiveFile.initialize());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SMIBool? backSwitch;
  SMINumber? direction;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RiveAnimation.asset(
          'assets/bee.riv',
          fit: BoxFit.fitHeight,
          onInit: (art) {
            _onRiveInit(art);
          },
        ),
      ),
    );
  }

  _onRiveInit(Artboard art) {
    final controller =
        StateMachineController.fromArtboard(art, "State Machine 1");

    art.addController(controller!);

    // direction = controller.findInput('Direction') as SMINumber?;

    // direction!.change(1);
  }
}
