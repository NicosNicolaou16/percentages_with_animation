import 'dart:math';
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
      title: 'Percentages With Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          onSurface: Colors.grey.shade100,
        ),
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
  // We use a state variable so we can trigger the animations dynamically!
  double _currentPercentage = 70;
  double _currentValue = 0;

  void _randomizePercentage() {
    setState(() {
      // Generates a random percentage between 10 and 100
      _currentPercentage = (Random().nextInt(90) + 10).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation Showcase',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Tap the button below to see the animations in action!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          _buildShowcaseCard(
            title: "Linear Percentage",
            child: LinearPercentage(
              currentPercentage: _currentPercentage,
              maxPercentage: 100,
              backgroundHeight: 24,
              percentageHeight: 24,
              leftRightText: LeftRightText.both,
              leftTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              rightTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              showPercentageOnPercentageView: true,
              percentageOnPercentageViewTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              backgroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              percentageDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              onCurrentValue: _logValue,
            ),
          ),
          const SizedBox(height: 16),
          // We use a Wrap here so circular indicators sit side-by-side on wider screens
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildShowcaseCard(
                title: "Circular",
                width: 170,
                child: CircularPercentage(
                  currentPercentage: _currentPercentage,
                  maxPercentage: 100,
                  size: 120,
                  duration: 1500,
                  percentageStrokeWidth: 12,
                  percentageColor: Colors.blueAccent,
                  backgroundColor: Colors.grey.shade300,
                  backgroundStrokeWidth: 4,
                  centerTextStyle: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  onCurrentValue: _logValue,
                ),
              ),
              _buildShowcaseCard(
                title: "Gradient Circle",
                width: 170,
                child: GradientCirclePercentage(
                  currentPercentage: _currentPercentage,
                  maxPercentage: 100,
                  size: 120,
                  duration: 1500,
                  percentageStrokeWidth: 12,
                  bottomColor: Colors.orangeAccent,
                  backgroundStrokeWidth: 4,
                  centerTextStyle: const TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  onCurrentValue: _logValue,
                ),
              ),
              _buildShowcaseCard(
                title: "Filled Circle",
                width: 170,
                child: CirclePercentage(
                  currentPercentage: _currentPercentage,
                  maxPercentage: 100,
                  size: 120,
                  duration: 1500,
                  percentageColor: Colors.green,
                  backgroundStrokeWidth: 0,
                  centerTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  onCurrentValue: _logValue,
                ),
              ),
              _buildShowcaseCard(
                title: "Wave",
                width: 170,
                child: WavePercentage(
                  currentPercentage: _currentPercentage,
                  maxPercentage: 100,
                  size: 120,
                  duration: 2000,
                  backgroundStrokeWidth: 2,
                  backgroundColor: Colors.teal.shade400,
                  centerTextStyle: TextStyle(
                    color: _currentValue < 50 ? Colors.black : Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  onCurrentValue: _logValue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          // Padding for the FAB
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _randomizePercentage,
        icon: const Icon(Icons.refresh),
        label: const Text("Randomize"),
      ),
    );
  }

  /// A helper method to create consistent, beautiful cards for each widget
  Widget _buildShowcaseCard({
    required String title,
    required Widget child,
    double? width,
  }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  void _logValue(double currentValue) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentValue = currentValue;
      setState(() {});
    });
    if (kDebugMode) {
      // You can uncomment this to see the continuous values in the console
      // print("Current Animated Value: $currentValue");
    }
  }
}
