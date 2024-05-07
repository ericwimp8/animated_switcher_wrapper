import 'package:flutter/material.dart';
import '../animated_switcher_wrapper.dart';

/// A widget that combines scale and fade animations to transition between widgets.
///
/// This widget is particularly useful for creating smooth animations during state changes,
/// adjusting scale and opacity based on the provided animation parameters.
/// It can be used within an [AnimatedSwitcher] or similar widget for seamless transitions.
class ScaleFadeTransition extends StatelessWidget {
  const ScaleFadeTransition({
    required this.animation,
    required this.child,
    this.scaleAlignment = Alignment.center,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.scaleBegin = kDefaultAnimationBeign,
    this.scaleEnd = kDefaultAnimationEnd,
    this.scaleCurve = kDefaultAnimationCurve,
    super.key,
  });

  /// The animation that drives the scale and fade transitions.
  ///
  /// This animation is passed to both the [FadeTransition] and [ScaleTransition] widgets.
  final Animation<double> animation;

  /// The widget to transition in and out.
  final Widget child;

  /// The alignment of the scaled widget.
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
      child: ScaleTransition(
        alignment: scaleAlignment,
        scale: Tween<double>(
          begin: scaleBegin,
          end: scaleEnd,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: scaleCurve,
          ),
        ),
        child: child,
      ),
    );
  }
}
