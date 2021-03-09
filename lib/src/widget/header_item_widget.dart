import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';
import 'package:sliver_header_delegate/src/extension/header_item_extensions.dart';

class HeaderItemWidget extends StatelessWidget {
  const HeaderItemWidget(
    this._item,
    this._progress, {
    Key? key,
  }) : super(key: key);

  final FlexibleHeaderItem? _item;
  final double _progress;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: _item!.paddingValue(_progress),
      margin: _item!.marginValue(_progress),
      alignment: _item!.alignmentValue(_progress),
      child: _item!.child != null ? _wrapWithOpacity() : const SizedBox(),
    );
  }

  Widget? _wrapWithOpacity() {
    return _item!.options.contains(HeaderItemOptions.hide)
        ? AnimatedOpacity(
            opacity: 1 - _progress,
            duration: const Duration(milliseconds: 150),
            child: _wrapWithScale())
        : _wrapWithScale();
  }

  Widget? _wrapWithScale() {
    return _item!.options.contains(HeaderItemOptions.scale)
        ? Transform.scale(
            scale: Tween<double>(begin: 1, end: 0).transform(_progress),
            child: _item!.child,
          )
        : _item!.child;
  }
}
