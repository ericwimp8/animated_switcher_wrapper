import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SizeFadeTransition', () {
    testWidgets('Check fadeEnd and sizeEnd are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeEnd = 0.9;
      const sizeEnd = 0.8;

      await tester.pumpWidget(
        MaterialApp(
          home: SizeFadeTransition(
            fadeEnd: fadeEnd,
            sizeEnd: sizeEnd,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final sizeTransitionFinder = find.byType(SizeTransition);
      expect(sizeTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeEnd);

      final sizeTransitionWidget =
          tester.widget<SizeTransition>(sizeTransitionFinder);
      final size = sizeTransitionWidget.sizeFactor;
      expect(size.value, sizeEnd);
    });

    testWidgets('Check fadeBegin and sizeBegin are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeBegin = 0.1;
      const sizeBegin = 0.2;

      await tester.pumpWidget(
        MaterialApp(
          home: SizeFadeTransition(
            fadeBegin: fadeBegin,
            sizeBegin: sizeBegin,
            animation: kAlwaysDismissedAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final sizeTransitionFinder = find.byType(SizeTransition);
      expect(sizeTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeBegin);

      final sizeTransitionWidget =
          tester.widget<SizeTransition>(sizeTransitionFinder);
      final size = sizeTransitionWidget.sizeFactor;

      expect(size.value, sizeBegin);
    });

    testWidgets('Check sizeAxis is passed to SizeTransition.',
        (WidgetTester tester) async {
      const axis = Axis.horizontal;

      await tester.pumpWidget(
        MaterialApp(
          home: SizeFadeTransition(
            sizeAxis: axis,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final sizeTransitionFinder = find.byType(SizeTransition);
      expect(sizeTransitionFinder, findsOneWidget);
      final sizeTransitionWidget =
          tester.widget<SizeTransition>(sizeTransitionFinder);

      final expectedAxis = sizeTransitionWidget.axis;
      expect(expectedAxis, axis);
    });
    testWidgets('Check sizeAxisAlignment is passed to SizeTransition.',
        (WidgetTester tester) async {
      const axisAlignment = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: SizeFadeTransition(
            sizeAxisAlignment: axisAlignment,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final sizeTransitionFinder = find.byType(SizeTransition);
      expect(sizeTransitionFinder, findsOneWidget);
      final sizeTransitionWidget =
          tester.widget<SizeTransition>(sizeTransitionFinder);

      final expectedAxisAlignment = sizeTransitionWidget.axisAlignment;
      expect(expectedAxisAlignment, axisAlignment);
    });
  });
}
