import 'package:flutter/foundation.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 55,
            ),
            const Text(
              "Linear Percentage",
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 59.0, left: 59),
              child: LinearPercentage(
                currentPercentage: 70,
                maxPercentage: 100,
                backgroundHeight: 20,
                percentageHeight: 20,
                leftRightText: LeftRightText.both,
                showPercentageOnPercentageView: true,
                percentageOnPercentageViewTextStyle:
                    const TextStyle(color: Colors.white),
                backgroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                percentageDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                onCurrentValue: (currentValue) {
                  if (kDebugMode) {
                    print("LinearPercentage currentValue: $currentValue");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Circular Percentage",
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            const SizedBox(
              height: 15,
            ),
            CircularPercentage(
              currentPercentage: 50,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              percentageStrokeWidth: 10,
              percentageColor: Colors.blue,
              backgroundColor: Colors.black,
              backgroundStrokeWidth: 2,
              centerTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
              onCurrentValue: (currentValue) {
                if (kDebugMode) {
                  print("CircularPercentage currentValue: $currentValue");
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Circle Percentage",
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            const SizedBox(
              height: 15,
            ),
            CirclePercentage(
              currentPercentage: 70,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              percentageColor: Colors.green,
              backgroundStrokeWidth: 2,
              centerTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
              onCurrentValue: (currentValue) {
                if (kDebugMode) {
                  print("CirclePercentage currentValue: $currentValue");
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Gradient Circle Percentage",
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            const SizedBox(
              height: 15,
            ),
            GradientCirclePercentage(
              currentPercentage: 70,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              percentageStrokeWidth: 10,
              bottomColor: Colors.green,
              backgroundStrokeWidth: 2,
              centerTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
              onCurrentValue: (currentValue) {
                if (kDebugMode) {
                  print("GradientCirclePercentage currentValue: $currentValue");
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Wave Circle Percentage",
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            const SizedBox(
              height: 15,
            ),
            WavePercentage(
              currentPercentage: 50,
              maxPercentage: 100,
              size: 150,
              duration: 2000,
              percentageStrokeWidth: 10,
              bottomColor: Colors.green,
              backgroundStrokeWidth: 2,
              centerTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 21,
              ),
              onCurrentValue: (currentValue) {
                if (kDebugMode) {
                  print("WavePercentage currentValue: $currentValue");
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
