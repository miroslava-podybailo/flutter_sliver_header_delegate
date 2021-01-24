import 'package:flutter/material.dart';
import 'package:sliver_flutter/sliver_flutter.dart';

class TransformableItemWidget extends StatelessWidget {
  const TransformableItemWidget(
    this._item,
    this._progress, {
    Key key,
  }) : super(key: key);

  final TransformableHeaderItem _item;
  final double _progress;

  @override
  Widget build(BuildContext context) {
    // return _item.child.transformTo(_item.key, _progress);
  }
}
