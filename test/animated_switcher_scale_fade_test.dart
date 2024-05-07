import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimatedSwitcherScaleFade', () {
    testWidgets(
        'AnimatedSwitcherScaleFade should pass correct properties to AnimatedSwitcher',
        (WidgetTester tester) async {
      const duration = Duration(seconds: 1);
      const reverseDuration = Duration(seconds: 2);
      const fadeBegin = 0.1;
      const fadeEnd = 0.9;
      const fadeCurve = Curves.easeInOut;
      const scaleBegin = 0.1;
      const scaleEnd = 0.9;
      const scaleCurve = Curves.easeInOut;
      const scaleAlignment = Alignment.topCenter;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedSwitcherScaleFade(
              scaleAlignment: scaleAlignment,
              duration: duration,
              reverseDuration: reverseDuration,
              fadeBegin: fadeBegin,
              fadeEnd: fadeEnd,
              fadeCurve: fadeCurve,
              scaleBegin: scaleBegin,
              scaleEnd: scaleEnd,
              scaleCurve: scaleCurve,
              child: Text('Test'),
            ),
          ),
        ),
      );

      final animatedSwitcherFinder = find.byType(AnimatedSwitcher);
      expect(animatedSwitcherFinder, findsOneWidget);

      final animatedSwitcherWidget =
          tester.widget<AnimatedSwitcher>(animatedSwitcherFinder);
      expect(animatedSwitcherWidget.duration, duration);
      expect(animatedSwitcherWidget.reverseDuration, reverseDuration);

      final transitionBuilder = animatedSwitcherWidget.transitionBuilder;
      const child = Text('Test');
      const animation = kAlwaysCompleteAnimation;
      final widget = transitionBuilder(child, animation);

      expect(widget, isA<ScaleFadeTransition>());
      final scaleFadeTransitionWidget = widget as ScaleFadeTransition;
      expect(scaleFadeTransitionWidget.animation, animation);
      expect(scaleFadeTransitionWidget.scaleBegin, scaleBegin);
      expect(scaleFadeTransitionWidget.scaleEnd, scaleEnd);
      expect(scaleFadeTransitionWidget.scaleCurve, scaleCurve);
      expect(scaleFadeTransitionWidget.fadeBegin, fadeBegin);
      expect(scaleFadeTransitionWidget.fadeEnd, fadeEnd);
      expect(scaleFadeTransitionWidget.fadeCurve, fadeCurve);
      expect(scaleFadeTransitionWidget.child, child);
      expect(scaleFadeTransitionWidget.scaleAlignment, scaleAlignment);
    });
  });
}
