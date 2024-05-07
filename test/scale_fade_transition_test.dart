import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScaleFadeTransition', () {
    testWidgets('Check fadeEnd and scaleEnd are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeEnd = 0.9;
      const scaleEnd = 0.8;

      await tester.pumpWidget(
        MaterialApp(
          home: ScaleFadeTransition(
            fadeEnd: fadeEnd,
            scaleEnd: scaleEnd,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final scaleTransitionFinder = find.byType(ScaleTransition);
      expect(scaleTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeEnd);

      final scaleTransitionWidget =
          tester.widget<ScaleTransition>(scaleTransitionFinder);
      final scale = scaleTransitionWidget.scale;
      expect(scale.value, scaleEnd);
    });

    testWidgets('Check fadeBegin and scaleBegin are passed to nested widgets.',
        (WidgetTester tester) async {
      const fadeBegin = 0.2;
      const scaleBegin = 0.1;

      await tester.pumpWidget(
        MaterialApp(
          home: ScaleFadeTransition(
            fadeBegin: fadeBegin,
            scaleBegin: scaleBegin,
            animation: kAlwaysDismissedAnimation,
            child: Container(),
          ),
        ),
      );

      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final scaleTransitionFinder = find.byType(ScaleTransition);
      expect(scaleTransitionFinder, findsOneWidget);

      final fadeTransitionWidget =
          tester.widget<FadeTransition>(fadeTransitionFinder);
      final opacity = fadeTransitionWidget.opacity.value;
      expect(opacity, fadeBegin);

      final scaleTransitionWidget =
          tester.widget<ScaleTransition>(scaleTransitionFinder);
      final scale = scaleTransitionWidget.scale;

      expect(scale.value, scaleBegin);
    });

    testWidgets('Check scaleAlignment is passed to ScaleTransition widgets.',
        (WidgetTester tester) async {
      const alignment = Alignment.bottomCenter;

      await tester.pumpWidget(
        MaterialApp(
          home: ScaleFadeTransition(
            scaleAlignment: alignment,
            animation: kAlwaysCompleteAnimation,
            child: Container(),
          ),
        ),
      );

      final scaleTransitionFinder = find.byType(ScaleTransition);
      expect(scaleTransitionFinder, findsOneWidget);
      final scaleTransitionWidget =
          tester.widget<ScaleTransition>(scaleTransitionFinder);

      final expectedAlignment = scaleTransitionWidget.alignment;
      expect(expectedAlignment, alignment);
    });
  });
}
