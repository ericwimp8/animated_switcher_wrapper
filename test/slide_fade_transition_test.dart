import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SlideFadeTransition', () {
    testWidgets('Check fadeEnd and slideEnd are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeEnd = 0.9;
      const slideEnd = Offset(0, 0.1);

      await tester.pumpWidget(
        MaterialApp(
          home: SlideFadeTransition(
            fadeEnd: fadeEnd,
            slideEnd: slideEnd,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final slideTransitionFinder = find.byType(SlideTransition);
      expect(slideTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeEnd);

      final slideTransitionWidget =
          tester.widget<SlideTransition>(slideTransitionFinder);
      final slide = slideTransitionWidget.position;
      expect(slide.value, slideEnd);
    });

    testWidgets('Check fadeBegin and slideBegin are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeBegin = 0.1;
      const slideBegin = Offset(0, 0.1);

      await tester.pumpWidget(
        MaterialApp(
          home: SlideFadeTransition(
            fadeBegin: fadeBegin,
            slideBegin: slideBegin,
            animation: kAlwaysDismissedAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final slideTransitionFinder = find.byType(SlideTransition);
      expect(slideTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeBegin);

      final slideTransitionWidget =
          tester.widget<SlideTransition>(slideTransitionFinder);
      final slide = slideTransitionWidget.position;

      expect(slide.value, slideBegin);
    });
  });
}
