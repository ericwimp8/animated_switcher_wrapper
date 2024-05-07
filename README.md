# Project README

## Description

This package is a basic wrapper for AnimatedSwitcher to provide some custom animations. It offers a convenient way to enhance the visual transitions in your Flutter applications.

## Features

- Provides custom animations for AnimatedSwitcher
- Easy to integrate with existing codebases
- Helps improve the user experience with smooth transitions

## Getting Started

To begin using this package, make sure you have Flutter installed. You can then follow these steps:

1. Add the package to your `pubspec.yaml` file.
2. Import the necessary components from this package.
3. Use the provided animations to enhance your app's transitions.

For more detailed instructions and examples, check out the `/example` folder in this repository.

## Additional Information

For more information, contributions, filing issues, or contacting the package authors, please visit the [GitHub repository](https://github.com/ericwimp8/animated_switcher_wrapper).

## Usage

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimatedSwitcherWrapperExample(),
    );
  }
}

class AnimatedSwitcherWrapperExample extends StatefulWidget {
  const AnimatedSwitcherWrapperExample({super.key});

  @override
  State<AnimatedSwitcherWrapperExample> createState() =>
      _AnimatedSwitcherWrapperExampleState();
}

class _AnimatedSwitcherWrapperExampleState
    extends State<AnimatedSwitcherWrapperExample> {
  var show = true;

  void toggle() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: toggle,
              child: const Text('Toggle'),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherScaleFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              color: Colors.blue[300],
                              child: const Align(child: Text('Scale Fade')),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherSizeFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              color: Colors.blue[100],
                              child: const Align(child: Text('Size Fade')),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherSlideFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              color: Colors.blue[200],
                              child: const Align(child: Text('Slide Fade')),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherScaleFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              key: ValueKey(Colors.blue[300]),
                              color: Colors.blue[300],
                              child: const Align(child: Text('Scale Fade')),
                            )
                          : Material(
                              key: ValueKey(Colors.green[300]),
                              color: Colors.green[300],
                              child: const Align(child: Text('Scale Fade')),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherSizeFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              key: ValueKey(Colors.blue[100]),
                              color: Colors.blue[100],
                              child: const Align(child: Text('Size Fade')),
                            )
                          : Material(
                              key: ValueKey(Colors.green[100]),
                              color: Colors.green[100],
                              child: const Align(child: Text('Size Fade')),
                            ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSwitcherSlideFade(
                      duration: Durations.long1,
                      child: show
                          ? Material(
                              key: ValueKey(Colors.blue[200]),
                              color: Colors.blue[200],
                              child: const Align(child: Text('Slide Fade')),
                            )
                          : Material(
                              key: ValueKey(Colors.green[200]),
                              color: Colors.green[200],
                              child: const Align(child: Text('Slide Fade')),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```
