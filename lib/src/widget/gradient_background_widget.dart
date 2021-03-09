import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class GradientBackgroundWidget extends StatelessWidget {
  const GradientBackgroundWidget(
    this._progress,
    this._gradientBackground, {
    Key? key,
  }) : super(key: key);

  final double _progress;
  final GradientBackground? _gradientBackground;

  @override
  Widget build(BuildContext context) {
    return _gradientBackground!.modifyGradient
        ? ShaderMask(
            blendMode: BlendMode.src,
            shaderCallback: (bounds) {
              return _gradientBackground!.gradient.createShader(
                Rect.fromLTWH(
                  0,
                  0,
                  Tween<double>(begin: bounds.width, end: 0)
                      .transform(_progress),
                  Tween<double>(begin: bounds.height, end: 0)
                      .transform(_progress),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: _gradientBackground!.gradient,
            ),
          );
  }
}
