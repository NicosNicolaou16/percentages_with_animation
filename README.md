## Features

This package provide you percentages with custom widgets and animation such as linear, circular,
circle, gradient circle and wave percentages.

## Getting started

Version Minimum Flutter SDK: 3.0.0

Tested Versioning: <br />
Flutter SDK version: 3.29.2 <br />
Dart Version: 3.7.2 <br /> <br />

## Usage

<p align="left">
  <a title="simulator_image"><img src="https://github.com/NicosNicolaou16/percentages_with_animation/raw/main/screenshots/Screenshot_20240615_105532.png" height="530" width="250"></a>
  <a title="simulator_image"><img src="https://github.com/NicosNicolaou16/percentages_with_animation/raw/main/screenshots/example_gif.gif" height="530" width="250"></a>
</p>

### Linear Percentage

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

### Circular Percentage

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

### Gradient Circle Percentage

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

### Wave Percentage

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
| `amplitudeBegin`        | This parameter is the amplitude begin with default value 10                                                                       |
| `amplitudeEnd`          | This parameter is the amplitude end with default value 10                                                                         |
| `backgroundStrokeWidth` | This parameter is the stroke width for the background gradient circle                                                             |
| `bottomColor`           | This parameter is the bottom color for the percentage                                                                             |
| `backgroundColor`       | This parameter is the circle color behind of the percentage                                                                       |
| `centerText`            | This parameter is a custom center text with default value null (if it null then show the percentage value)                        |
| `centerTextStyle`       | This parameter is the text style of the label for the percentage text                                                             |
| `onCurrentValue`        | This parameter is the call back to get the current percentage value during the animation (optional)                               |

```dart
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
              "Wave Percentage",
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
              backgroundStrokeWidth: 2,
              backgroundColor: Colors.green,
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

```

## Additional information

Thank you for using my package, any feedback is welcome. You can report any bug, ask a question on
package GitHub repository.
https://github.com/NicosNicolaou16/percentages_with_animation/issues
