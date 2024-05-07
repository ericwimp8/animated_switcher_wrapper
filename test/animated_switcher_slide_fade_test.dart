import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimatedSwitcherSlideFade', () {
    testWidgets(
        'AnimatedSwitcherSlideFade should pass correct properties to AnimatedSwitcher',
        (WidgetTester tester) async {
      const duration = Duration(seconds: 1);
      const reverseDuration = Duration(seconds: 2);
      const fadeBegin = 0.1;
      const fadeEnd = 0.9;
      const fadeCurve = Curves.easeInOut;
      const slideBegin = Offset(0, 0.1);
      const slideEnd = Offset(0, 0.9);
      const slideCurve = Curves.easeInOut;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedSwitcherSlideFade(
              duration: duration,
              reverseDuration: reverseDuration,
              fadeBegin: fadeBegin,
              fadeEnd: fadeEnd,
              fadeCurve: fadeCurve,
              slideBegin: slideBegin,
              slideEnd: slideEnd,
              slideCurve: slideCurve,
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

      expect(widget, isA<SlideFadeTransition>());
      final slideFadeTransitionWidget = widget as SlideFadeTransition;
      expect(slideFadeTransitionWidget.animation, animation);
      expect(slideFadeTransitionWidget.slideBegin, slideBegin);
      expect(slideFadeTransitionWidget.slideEnd, slideEnd);
      expect(slideFadeTransitionWidget.slideCurve, slideCurve);
      expect(slideFadeTransitionWidget.fadeBegin, fadeBegin);
      expect(slideFadeTransitionWidget.fadeEnd, fadeEnd);
      expect(slideFadeTransitionWidget.fadeCurve, fadeCurve);
      expect(slideFadeTransitionWidget.child, child);
    });
  });
}
