import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that transitions its child using a combination of scale and fade animations within an [AnimatedSwitcher].
///
/// The [AnimatedSwitcherScaleFade] widget takes in parameters for duration, reverseDuration, scale alignment, fade begin and end values,
/// fade curve, scale begin and end values, and scale curve to customize the scale and fade animations.
///
/// It internally uses a [ScaleFadeTransition] widget to apply the scale and fade animations to the child widget.
class AnimatedSwitcherScaleFade extends StatelessWidget {
  const AnimatedSwitcherScaleFade({
    required this.child,
    super.key,
    this.duration = kDefaultAnimationDuration,
    this.reverseDuration = kDefaultAnimationDuration,
    this.scaleAlignment = Alignment.center,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.scaleBegin = kDefaultAnimationBeign,
    this.scaleEnd = kDefaultAnimationEnd,
    this.scaleCurve = kDefaultAnimationCurve,
    this.slideBegin = const Offset(0, 0.3),
    this.slideEnd = Offset.zero,
    this.slideCurve = kDefaultAnimationCurve,
  });

  /// The widget to transition in and out.
  final Widget child;

  /// The duration of the animation.
  ///
  /// Defaults to [kDefaultAnimationDuration].
  final Duration duration;

  /// The duration of the reverse animation.
  ///
  /// Defaults to [kDefaultAnimationDuration].
  final Duration reverseDuration;

  /// The alignment of the scale transition.
  ///
  /// Defaults to [Alignment.center].
  final Alignment scaleAlignment;

  /// The beginning opacity value for the fade transition.
  ///
  /// Defaults to [kDefaultAnimationBeign].
  final double fadeBegin;

  /// The ending opacity value for the fade transition.
  ///
  /// Defaults to [kDefaultAnimationEnd].
  final double fadeEnd;

  /// The curve to use for the fade transition.
  ///
  /// Defaults to [kDefaultAnimationCurve].
  final Curve fadeCurve;

  /// The beginning scale value for the scale transition.
  ///
  /// Defaults to [kDefaultAnimationBeign].
  final double scaleBegin;

  /// The ending scale value for the scale transition.
  ///
  /// Defaults to [kDefaultAnimationEnd].
  final double scaleEnd;

  /// The curve to use for the scale transition.
  ///
  /// Defaults to [kDefaultAnimationCurve].
  final Curve scaleCurve;

  /// The beginning position value for the slide transition.
  ///
  /// Defaults to Offset(0, 0.3).
  final Offset slideBegin;

  /// The ending position value for the slide transition.
  ///
  /// Defaults to Offset.zero.
  final Offset slideEnd;

  /// The curve to use for the slide transition.
  ///
  /// Defaults to [kDefaultAnimationCurve].
  final Curve slideCurve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      transitionBuilder: (child, animation) {
        return ScaleFadeTransition(
          animation: animation,
          scaleAlignment: scaleAlignment,
          fadeBegin: fadeBegin,
          fadeEnd: fadeEnd,
          fadeCurve: fadeCurve,
          scaleBegin: scaleBegin,
          scaleEnd: scaleEnd,
          scaleCurve: scaleCurve,
          child: child,
        );
      },
      child: child,
    );
  }
}
