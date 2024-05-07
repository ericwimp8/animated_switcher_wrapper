import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimatedSwitcherSizeFade', () {
    testWidgets(
        'AnimatedSwitcherSizeFade should pass correct properties to AnimatedSwitcher',
        (WidgetTester tester) async {
      const duration = Duration(seconds: 1);
      const reverseDuration = Duration(seconds: 2);
      const fadeBegin = 0.1;
      const fadeEnd = 0.9;
      const fadeCurve = Curves.easeInOut;
      const sizeAxis = Axis.horizontal;
      const sizeBegin = 0.1;
      const sizeEnd = 0.9;
      const sizeCurve = Curves.easeInOut;
      const sizeAxisAlignment = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedSwitcherSizeFade(
              sizeAxis: sizeAxis,
              duration: duration,
              reverseDuration: reverseDuration,
              fadeBegin: fadeBegin,
              fadeEnd: fadeEnd,
              fadeCurve: fadeCurve,
              sizeBegin: sizeBegin,
              sizeEnd: sizeEnd,
              sizeCurve: sizeCurve,
              sizeAxisAlignment: sizeAxisAlignment,
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

      expect(widget, isA<SizeFadeTransition>());
      final sizeFadeTransitionWidget = widget as SizeFadeTransition;
      expect(sizeFadeTransitionWidget.animation, animation);
      expect(sizeFadeTransitionWidget.fadeBegin, fadeBegin);
      expect(sizeFadeTransitionWidget.fadeEnd, fadeEnd);
      expect(sizeFadeTransitionWidget.fadeCurve, fadeCurve);
      expect(sizeFadeTransitionWidget.sizeBegin, sizeBegin);
      expect(sizeFadeTransitionWidget.sizeEnd, sizeEnd);
      expect(sizeFadeTransitionWidget.sizeCurve, sizeCurve);
      expect(sizeFadeTransitionWidget.sizeAxisAlignment, sizeAxisAlignment);
      expect(sizeFadeTransitionWidget.child, child);
      expect(sizeFadeTransitionWidget.sizeAxis, sizeAxis);
    });
  });
}
