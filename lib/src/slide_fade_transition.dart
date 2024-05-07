import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that combines slide and fade animations to transition between widgets.
///
/// This widget is particularly useful for creating smooth animations during state changes,
/// adjusting position and opacity based on the provided animation parameters.
/// It can be used within an [AnimatedSwitcher] or similar widget for seamless transitions.
class SlideFadeTransition extends StatelessWidget {
  const SlideFadeTransition({
    required this.animation,
    required this.child,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.slideBegin = const Offset(0, 0.3),
    this.slideEnd = Offset.zero,
    this.slideCurve = kDefaultAnimationCurve,
    super.key,
  });

  /// The animation that drives the slide and fade transitions.
  ///
  /// This animation is passed to both the [FadeTransition] and [SlideTransition] widgets.
  final Animation<double> animation;

  /// The widget to transition in and out.
  final Widget child;

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
    return FadeTransition(
      opacity: Tween<double>(
        begin: fadeBegin,
        end: fadeEnd,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: fadeCurve,
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: slideBegin,
          end: slideEnd,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: slideCurve,
          ),
        ),
        child: child,
      ),
    );
  }
}
