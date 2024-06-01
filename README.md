## Features

This package provide you percentages custom widgets with animations such as linear, circular, circle
and gradient circle percentages.

## Getting started

### Versioning
Minimum Flutter SDK: 2.12.0

## Usage

<p align="left">
  <a title="simulator_image"><img src="screenshots/Screenshot_20240601_011241.png" height="530" width="250"></a>
</p>

```dart
import 'package:flutter/material.dart';
import 'package:percentages_with_animation/percentages_with_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percentage With Animation Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(59.0),
              child: LinearPercentage(
                currentPercentage: 70,
                maxPercentage: 100,
                height: 20,
                heightPercentage: 20,
                leftRightText: LeftRightText.both,
                backgroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                percentageDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CircularPercentage(
              currentPercentage: 50,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              strokeWidth: 10,
              color: Colors.blue,
              backgroundColor: Colors.black,
              backgroundStrokeWidth: 2,
              textStyle: TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CirclePercentage(
              currentPercentage: 70,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              strokeWidth: 10,
              color: Colors.green,
              backgroundStrokeWidth: 2,
              textStyle: TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const GradientCirclePercentage(
              currentPercentage: 70,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              strokeWidth: 10,
              bottomColor: Colors.green,
              backgroundStrokeWidth: 2,
              textStyle: TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
