## 1.1.7

What's new:
- Fixed a crash in `WavePercentage` when `colorAnimationBegin` / `colorAnimationEnd` were set.
- Fixed `LinearPercentage` progress being overstated when the left/right labels are shown.
- Fixed `onCurrentValue` on `LinearPercentage` not firing unless the left label was shown.
- Fixed `onCurrentValue` firing endlessly after the animation finished, in all percentage widgets. It is now called after the frame and only when the value changes, so calling `setState` inside it is safe.
- Fixed the `CircularPercentage` arc not being centered on its background ring.
- Fixed decimal max values being truncated in the `LinearPercentage` labels (e.g. 99.5 showed as 99).
- `CirclePercentage` now fills from 12 o'clock, like `CircularPercentage`.
- `WavePercentage` now applies amplitude and color changes made after the first build, and accepts an amplitude of 0.
- The painters now repaint only when something visible changes.
- Added an assert for `maxPercentage > 0`.
- Corrected the minimum Flutter version to 3.10.0.
- Updated and tested the example project with the latest Flutter SDK 3.47.7.

## 1.1.6

What's new:
- Complete UI refresh across the example project.
- Updated and tested the example project with the latest Flutter SDK 3.44.8.
- Updated the Android Side for example project.
  - Set target SDK to 37.
  - Updated Gradle to latest version.
  - Updated Kotlin to latest version.
- Updated the README file.

## 1.1.5

What's new:
- Updated and tested the example project with the latest Flutter SDK 3.41.5.
- Removed warnings and unnecessary code.
- Updated the Android Side for example project.
  - Updated Gradle to latest version.
  - Updated Kotlin to latest version.
- Updated the README file.

## 1.1.4

What's new:
- Updated and tested the example project with the latest Flutter SDK 3.35.7.
- Removed warnings and unnecessary code.
- Updated the Android Side for example project.
  - Updated Kotlin to latest version.
  - Updated NDK to latest version.
  - Updated CMake to latest version.
- Updated the README file.

## 1.1.3

What's new:
- Updated and tested the example project with the latest Flutter SDK 3.35.5.
- Updated the Android Side for example project.
  - Updated Gradle to latest version.
  - Updated Kotlin to latest version.
  - Updated NDK to latest version.
  - Updated CMake to latest version.
  - Updated Target SDK to latest version.
  - Migrated Gradle files from Groovy to KTS.
- Updated the README file.

## 1.1.2

What's new:
- Updated and tested the example project with the latest Flutter SDK 3.35.1.
- Updated the Android Side for example project.
  - Updated Gradle to latest version.
  - Updated Kotlin to latest version.
  - Updated NDK to latest version.
  - Updated CMake to latest version.
  - Updated Target SDK to latest version.
- Updated the README file.

## 1.1.1

What's new:
- Updated and tested the example project with the latest Flutter SDK 3.32.2.
- Updated the Android Side.
  - Updated Gradle to latest version.
  - Updated Kotlin to latest version.
  - Updated NDK to latest version.
  - Updated CMake to latest version.

## 1.1.0

What's new:
- New Feature:
  - Added a new Wave Percentage with animation with various customizations.
- Updates:
  - Updated and tested the example project with the latest Flutter SDK 3.29.2.
  - Updated the Android Side.
    - Updated Gradle to latest version.
    - Updated Kotlin to latest version.
    - Updated CMake to latest version.
  - Updated/Fixed the README file and improve the documentation.

## 1.0.5

What's new:
- Updated the example project with the latest Flutter SDK 3.29.0 and tested.
- Updated the Android Side.
  - Updated Gradle to latest version.
  - Updated NDK and CMake to latest Versions.

## 1.0.4

What's new:
- Updated the example project with the latest Flutter SDK and tested.
- Updated the README file and improve the documentation.
- Updated the Android Side.
  - Updated Gradle to latest version.
  - Updated Kotlin to Version.

## 1.0.3

What's new:
- Updated the example project with the latest Flutter SDK and tested.
- Updated the README file and improve the documentation.
- Updated the Android Side.

## 1.0.2

What's new:
- Updated the example project with the latest Flutter SDK and tested.
- Updated the README file and improve the documentation.
- Updated the Android Side, updated NDK and updated Java version.
- Minor fixes.

## 1.0.1

What's new:
- Updated the example project with the latest Flutter SDK and tested.
- Updated the README file and improve the documentation.

## 1.0.0

What's new:
- Added a call back listener `onCurrentValue` for all percentages (Optional) and return the current percentage value (the value that return is with `value.toStringAsFixed(2)` and `double` type).
- Updated the Example project with the new Flutter SDK.
- Updated the README file and improve the documentation.

## 0.0.9

What's new:
- All the percentages show the decimal/double values on the percentage text.

## 0.0.8

What's new:
- Added new option for Circle, Circular and Gradient Circle Percentages for custom center text instead only the percentage -> `centerText`.
- Breaking Changes:
  - Changed the parameter for Circle, Circular and Gradient Circle Percentages from `textStyle` to `centerTextStyle` for the center text.
- Updated the documentation and README file.

## 0.0.7

What's new:
- Important change from the previous version - Breaking Changes:
  - Changed the name of the parameter for Linear Percentage from `showLabelOnPercentage` and `labelOnPercentageStyle` to `showPercentageOnPercentageView` and `percentageOnPercentageViewTextStyle`
- Minor fixes.

## 0.0.6+3

What's new:
- Added the option to show text label on the linear percentage.
- Added text style for the text label on the linear percentage.
- Updated the documentation.
- Fixed README file.

## 0.0.6+2

What's new:
- Added the option to show text label on the linear percentage.
- Added text style for the text label on the linear percentage.
- Updated the documentation.
- Fixed README file.

## 0.0.6+1

What's new:
- Added the option to show text label on the linear percentage.
- Added text style for the text label on the linear percentage.
- Updated the documentation.
- Fixed README file.

## 0.0.6

What's new:
- Added the option to show text label on the linear percentage.
- Added text style for the text label on the linear percentage.
- Updated the documentation.

## 0.0.5+3

What's new:
- Improved the documentation and add comments.
- Removed unused `strokeWidth` parameter from `CirclePercentage` widget.

## 0.0.5+2

* - Update README file

## 0.0.5+1

* - Update README file

## 0.0.5

* - Minor fixes

## 0.0.4

* - Minor fixes

## 0.0.3

* - Fix minimum Flutter version

## 0.0.2

* - Fix screenshots for example

## 0.0.1

* - Initial Release