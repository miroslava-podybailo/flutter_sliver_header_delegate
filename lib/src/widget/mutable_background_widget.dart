import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

class MutableBackgroundWidget extends StatelessWidget {
  const MutableBackgroundWidget(
    this._progress,
    this._mutableBackground, {
    Key? key,
  }) : super(key: key);

  final double _progress;
  final MutableBackground? _mutableBackground;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          duration: _mutableBackground!.animationDuration,
          opacity: _progress,
          child: _buildWidget(
            _mutableBackground!.collapsedWidget,
            _mutableBackground!.collapsedColor,
          ),
        ),
        AnimatedOpacity(
          duration: _mutableBackground!.animationDuration,
          opacity: 1 - _progress,
          child: _buildWidget(
            _mutableBackground!.expandedWidget,
            _mutableBackground!.expandedColor,
          ),
        ),
      ],
    );
  }

  Widget _buildWidget(Widget? widget, Color? color) {
    return widget ??
        (color == null ? const SizedBox() : Container(color: color));
  }
}
