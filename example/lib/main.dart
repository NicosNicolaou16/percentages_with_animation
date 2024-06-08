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
      body: Column(
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
            height: 35,
          ),
          const Text(
            "Circular Percentage",
            style: TextStyle(color: Colors.black, fontSize: 21),
          ),
          const SizedBox(
            height: 15,
          ),
          const CircularPercentage(
            currentPercentage: 50,
            maxPercentage: 100,
            size: 150,
            duration: 2000,
            percentageStrokeWidth: 10,
            percentageColor: Colors.blue,
            backgroundColor: Colors.black,
            backgroundStrokeWidth: 2,
            textStyle: TextStyle(
              color: Colors.red,
              fontSize: 21,
            ),
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
          const CirclePercentage(
            currentPercentage: 70,
            maxPercentage: 100,
            size: 150,
            duration: 2000,
            percentageColor: Colors.green,
            backgroundStrokeWidth: 2,
            textStyle: TextStyle(
              color: Colors.red,
              fontSize: 21,
            ),
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
          const GradientCirclePercentage(
            currentPercentage: 70,
            maxPercentage: 100,
            size: 150,
            duration: 2000,
            percentageStrokeWidth: 10,
            bottomColor: Colors.green,
            backgroundStrokeWidth: 2,
            textStyle: TextStyle(
              color: Colors.red,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
