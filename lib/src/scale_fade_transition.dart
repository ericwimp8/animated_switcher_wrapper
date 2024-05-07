import 'package:flutter/material.dart';

import '../animated_switcher_wrapper.dart';

class ScaleFadeTransition extends StatefulWidget {
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

  final Animation<double> animation;
  final Widget child;
  final Alignment scaleAlignment;
  final double fadeBegin;
  final double fadeEnd;
  final Curve fadeCurve;
  final double scaleBegin;
  final double scaleEnd;
  final Curve scaleCurve;

  @override
  State<ScaleFadeTransition> createState() => _ScaleFadeTransitionState();
}

class _ScaleFadeTransitionState extends State<ScaleFadeTransition> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: widget.fadeBegin,
        end: widget.fadeEnd,
      ).animate(
        CurvedAnimation(
          parent: widget.animation,
          curve: widget.fadeCurve,
        ),
      ),
      child: ScaleTransition(
        alignment: widget.scaleAlignment,
        scale: Tween<double>(
          begin: widget.scaleBegin,
          end: widget.scaleEnd,
        ).animate(
          CurvedAnimation(
            parent: widget.animation,
            curve: widget.scaleCurve,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
