import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that combines fade and size animations to transition between widgets.
///
/// This widget is particularly useful for creating smooth animations during state changes,
/// adjusting opacity and size based on the provided animation parameters.
/// It can be used within an [AnimatedSwitcher] or similar widget for seamless transitions.
class SizeFadeTransition extends StatelessWidget {
  const SizeFadeTransition({
    required this.animation,
    required this.child,
    this.fadeBegin = kDefaultAnimationBeign,
    this.fadeEnd = kDefaultAnimationEnd,
    this.fadeCurve = kDefaultAnimationCurve,
    this.sizeBegin = kDefaultAnimationBeign,
    this.sizeEnd = kDefaultAnimationEnd,
    this.sizeCurve = kDefaultAnimationCurve,
    this.sizeAxis = Axis.vertical,
    this.sizeAxisAlignment = -1,
    super.key,
  });

  /// The animation that drives the fade and size transitions.
  ///
  /// This animation is passed to both the [FadeTransition] and [SizeTransition] widgets.
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

  /// The axis along which the size transition occurs.
  ///
  /// Defaults to [Axis.vertical].
  final Axis sizeAxis;

  /// The alignment of the size transition along the [sizeAxis].
  ///
  /// Defaults to -1, which means the size transition will occur from the center of the widget.
  final double sizeAxisAlignment;

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
      child: SizeTransition(
        axisAlignment: sizeAxisAlignment,
        sizeFactor: Tween<double>(
          begin: sizeBegin,
          end: sizeEnd,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: sizeCurve,
          ),
        ),
        axis: sizeAxis,
        child: child,
      ),
    );
  }
}
