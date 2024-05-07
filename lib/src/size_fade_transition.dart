import 'package:animated_switcher_wrapper/animated_switcher_wrapper.dart';
import 'package:flutter/material.dart';

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
  final Animation<double> animation;
  final Widget child;
  final double fadeBegin;
  final double fadeEnd;
  final Curve fadeCurve;
  final double sizeBegin;
  final double sizeEnd;
  final Curve sizeCurve;
  final Axis sizeAxis;
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
