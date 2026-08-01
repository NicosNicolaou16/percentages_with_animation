## ✨ Features

A collection of highly customizable percentage widgets for Flutter, designed with smooth animations and versatile styles:

* ✨ **Linear Percentages** – Sleek and modern progress bars with optional labels, smooth animations, and customizable styling.
* 🎯 **Circular & Circle Percentages** – Elegant radial progress indicators designed for beautiful percentage visualization.
* 🌈 **Gradient Circles** – Eye-catching circular progress with stunning multi-color gradient transitions.
* 🌊 **Wave Animations** – Dynamic fluid-filled circular containers with smooth, realistic wave effects.
* ⚡ **Smooth Animations** – Fully controllable animation durations, easing, and real-time value listeners for seamless interactions.
* 🎨 **Highly Customizable** – Easily customize strokes, gradients, colors, decorations, text styles, and much more to match your app's design.


## Getting started

Version Minimum Flutter SDK: 3.0.0

Tested Versioning: <br />
Flutter SDK version: 3.44.8 <br />
Dart Version: 3.12.2 <br /> <br />

## Usage

<p align="left">
  <a title="simulator_image"><img src="https://github.com/NicosNicolaou16/percentages_with_animation/raw/main/screenshots/Screenshot_20260801_013452.png" height="530" width="250"></a>
  <a title="simulator_image"><img src="https://github.com/NicosNicolaou16/percentages_with_animation/raw/main/screenshots/example2_gif.gif" height="530" width="250"></a>
</p>

### ✨ Linear Percentage

| Parameters                            | Description                                                                                                                                                              |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `currentPercentage`                   | This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0)                                        |
| `maxPercentage`                       | This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)                                                                   |
| `backgroundHeight`                    | This parameter is required and it's the background height behind of the percentage view                                                                                  |
| `percentageHeight`                    | This parameter is required and it's the percentage height                                                                                                                |
| `duration`                            | This parameter is the duration for the animation with default value 1000 ms                                                                                              |
| `backgroundDecoration`                | This parameter is the background decoration behind of the percentage view                                                                                                |
| `percentageDecoration`                | This parameter is the percentage decoration                                                                                                                              |
| `backgroundColor`                     | This parameter is the background color behind of the percentage view with default value black26                                                                          |
| `percentageColor`                     | This parameter is the percentage color with default value black                                                                                                          |
| `leftRightText`                       | This parameter is the enum value for the left and right text (min and max value - label) - accepted value `leftOnly`, `rightOnly`, `both`, `none`, default value: `none` |
| `leftTextStyle`                       | This parameter is the text style for the left text                                                                                                                       |
| `rightTextStyle`                      | This parameter is the text style for the right text                                                                                                                      |
| `leftTextRightPadding`                | This parameter is the right text padding from percentage view with default value: 5                                                                                      |
| `rightTextRightPadding`               | This parameter is the left text padding from percentage view with default value: 5                                                                                       |
| `showPercentageOnPercentageView`      | This parameter is the option to show the percentage value on percentage view with default value: false                                                                   |
| `percentageOnPercentageViewTextStyle` | This parameter is the text style for percentage on percentage view                                                                                                       |
| `onCurrentValue`                      | This parameter is the call back to get the current percentage value during the animation (optional)                                                                      |

### 🎯 Circular Percentage

| Parameters              | Description                                                                                                                       |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `currentPercentage`     | This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0) |
| `maxPercentage`         | This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)                            |
| `size`                  | This parameter is the circle size for the percentage with default size 100                                                        |
| `duration`              | This parameter is the duration for the animation with default value 1000 ms                                                       |
| `percentageStrokeWidth` | This parameter is the stroke width for the percentage gradient circle                                                             |
| `backgroundStrokeWidth` | This parameter is the stroke width for the background gradient circle                                                             |
| `percentageColor`       | This parameter is the bottom color for the percentage                                                                             |
| `backgroundColor`       | This parameter is the circle color behind of the percentage                                                                       |
| `centerText`            | This parameter is a custom center text with default value null (if it null then show the percentage value)                        |
| `centerTextStyle`       | This parameter is the text style of the label for the percentage text                                                             |
| `onCurrentValue`        | This parameter is the call back to get the current percentage value during the animation (optional)                               |

### Circle Percentage

| Parameters              | Description                                                                                                                       |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `currentPercentage`     | This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0) |
| `maxPercentage`         | This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)                            |
| `size`                  | This parameter is the circle size for the percentage with default size 100                                                        |
| `duration`              | This parameter is the duration for the animation with default value 1000 ms                                                       |
| `percentageStrokeWidth` | This parameter is the stroke width for the background gradient circle                                                             |
| `backgroundStrokeWidth` | This parameter is the background stroke width behind of the percentage view                                                       |
| `percentageColor`       | This parameter is the bottom color for the percentage                                                                             |
| `backgroundColor`       | This parameter is the circle color behind of the percentage                                                                       |
| `centerText`            | This parameter is a custom center text with default value null (if it null then show the percentage value)                        |
| `centerTextStyle`       | This parameter is the text style of the label for the percentage text                                                             |
| `onCurrentValue`        | This parameter is the call back to get the current percentage value during the animation (optional)                               |

### 🌈 Gradient Circle Percentage

| Parameters              | Description                                                                                                                       |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `currentPercentage`     | This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0) |
| `maxPercentage`         | This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)                            |
| `size`                  | This parameter is the circle size for the percentage with default size 100                                                        |
| `duration`              | This parameter is the duration for the animation with default value 1000 ms                                                       |
| `percentageStrokeWidth` | This parameter is the stroke width for the percentage gradient circle                                                             |
| `backgroundStrokeWidth` | This parameter is the stroke width for the background gradient circle                                                             |
| `bottomColor`           | This parameter is the bottom color for the percentage                                                                             |
| `topColor`              | This parameter is the remaining color for the percentage circle                                                                   |
| `backgroundColor`       | This parameter is the circle color behind of the percentage                                                                       |
| `centerText`            | This parameter is a custom center text with default value null (if it null then show the percentage value)                        |
| `centerTextStyle`       | This parameter is the text style of the label for the percentage text                                                             |
| `onCurrentValue`        | This parameter is the call back to get the current percentage value during the animation (optional)                               |

### 🌊 Wave Percentage

| Parameters              | Description                                                                                                                       |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `currentPercentage`     | This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0) |
| `maxPercentage`         | This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)                            |
| `waveFrequency`         | This parameter is the wave frequency for the percentage with default value 2                                                      |
| `size`                  | This parameter is the circle size for the percentage with default size 100                                                        |
| `duration`              | This parameter is the duration for the animation with default value 1000 ms                                                       |
| `waveColor`             | This parameter is the wave color with default value green                                                                         |
| `colorAnimationBegin`   | This parameter is the color animation begin with default value null (if it null then use the waveColor)                           |
| `colorAnimationEnd`     | This parameter is the color animation end with default value null (if it null then use the waveColor)                             |
| `amplitudeBegin`        | This parameter is the amplitude begin with default value 10 (amplitudeBegin >= 0)                                                 |
| `amplitudeEnd`          | This parameter is the amplitude end with default value 10 (amplitudeEnd >= 0)                                                     |
| `backgroundStrokeWidth` | This parameter is the stroke width for the background gradient circle                                                             |
| `bottomColor`           | This parameter is the bottom color for the percentage                                                                             |
| `backgroundColor`       | This parameter is the circle color behind of the percentage                                                                       |
| `centerText`            | This parameter is a custom center text with default value null (if it null then show the percentage value)                        |
| `centerTextStyle`       | This parameter is the text style of the label for the percentage text                                                             |
| `onCurrentValue`        | This parameter is the call back to get the current percentage value during the animation (optional)                               |

```dart
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


```

## ℹ️ Additional information

Thank you for using **percentages_with_animation**! Your feedback helps make this package better.
If you encounter any bugs or unexpected behavior, please open an issue on
the [GitHub repository](https://github.com/NicosNicolaou16/percentages_with_animation/issues).
