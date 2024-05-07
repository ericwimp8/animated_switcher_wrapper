import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that transitions its child using a combination of slide and fade animations within an [AnimatedSwitcher].
///
/// The [AnimatedSwitcherSlideFade] widget takes in parameters for duration, reverseDuration, fade begin and end values,
/// fade curve, slide begin and end values, and slide curve to customize the slide and fade animations.
///
/// It internally uses a [SlideFadeTransition] widget to apply the slide and fade animations to the child widget.
class AnimatedSwitcherSlideFade extends StatelessWidget {
  const AnimatedSwitcherSlideFade({
    super.key,
    this.child,
    this.duration = kDefaultAnimationDuration,
    this.reverseDuration = kDefaultAnimationDuration,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.slideBegin = const Offset(0, 0.3),
    this.slideEnd = Offset.zero,
    this.slideCurve = kDefaultAnimationCurve,
  });

  /// The widget to transition in and out.
  final Widget? child;

  /// The duration of the animation.
  ///
  /// Defaults to [kDefaultAnimationDuration].
  final Duration duration;

  /// The duration of the reverse animation.
  ///
  /// Defaults to [kDefaultAnimationDuration].
  final Duration reverseDuration;

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
  /// Defaults to [Offset(0, 0.3)].
  final Offset slideBegin;

  /// The ending position value for the slide transition.
  ///
  /// Defaults to [Offset.zero].
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
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        return SlideFadeTransition(
          animation: animation,
          slideBegin: slideBegin,
          slideEnd: slideEnd,
          slideCurve: slideCurve,
          fadeBegin: fadeBegin,
          fadeEnd: fadeEnd,
          fadeCurve: fadeCurve,
          child: child,
        );
      },
      child: child,
    );
  }
}
