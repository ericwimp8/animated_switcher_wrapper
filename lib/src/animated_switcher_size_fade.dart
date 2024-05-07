import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that transitions its child using a combination of size and fade animations within an [AnimatedSwitcher].
///
/// The [AnimatedSwitcherSizeFade] widget takes in parameters for duration, reverseDuration, size axis, fade begin and end values,
/// fade curve, size begin and end values, and size curve to customize the size and fade animations.
///
/// It internally uses a [SizeFadeTransition] widget to apply the size and fade animations to the child widget.
class AnimatedSwitcherSizeFade extends StatelessWidget {
  const AnimatedSwitcherSizeFade({
    required this.child,
    super.key,
    this.duration = kDefaultAnimationDuration,
    this.reverseDuration = kDefaultAnimationDuration,
    this.sizeAxis = Axis.vertical,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.sizeBegin = kDefaultAnimationBeign,
    this.sizeEnd = kDefaultAnimationEnd,
    this.sizeCurve = kDefaultAnimationCurve,
    this.sizeAxisAlignment = -1,
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

  /// The axis along which the size of the child widget will change.
  ///
  /// Defaults to [Axis.vertical].
  final Axis sizeAxis;

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

  /// The beginning size value for the size transition.
  ///
  /// Defaults to [kDefaultAnimationBeign].
  final double sizeBegin;

  /// The ending size value for the size transition.
  ///
  /// Defaults to [kDefaultAnimationEnd].
  final double sizeEnd;

  /// The curve to use for the size transition.
  ///
  /// Defaults to [kDefaultAnimationCurve].
  final Curve sizeCurve;

  /// The alignment of the size transition along the size axis.
  ///
  /// Defaults to `-1`.
  final double sizeAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      transitionBuilder: (child, animation) {
        return SizeFadeTransition(
          sizeAxis: sizeAxis,
          animation: animation,
          fadeBegin: fadeBegin,
          fadeEnd: fadeEnd,
          fadeCurve: fadeCurve,
          sizeBegin: sizeBegin,
          sizeEnd: sizeEnd,
          sizeCurve: sizeCurve,
          sizeAxisAlignment: sizeAxisAlignment,
          child: child,
        );
      },
      child: child,
    );
  }
}
