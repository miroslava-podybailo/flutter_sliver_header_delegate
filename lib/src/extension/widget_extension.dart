import 'package:flutter/material.dart';
import 'package:sliver_flutter/sliver_flutter.dart';
import 'package:sliver_flutter/src/widget/flexible_text_widget.dart';
import 'package:sliver_flutter/src/widget/gradient_background_widget.dart';
import 'package:sliver_flutter/src/widget/header_item_widget.dart';
import 'package:sliver_flutter/src/widget/mutable_background_widget.dart';
import 'package:sliver_flutter/src/widget/transformable_item_widget.dart';

extension XWidget on Widget {
  Widget transform(double progress) {
    if (this is FlexibleTextItem) {
      return FlexibleTextItemWidget(this, progress);
    } else if (this is TransformableHeaderItem) {
      return TransformableItemWidget(this, progress);
    } else if (this is FlexibleHeaderItem) {
      return HeaderItemWidget(this, progress);
    } else if (this is MutableBackground) {
      return MutableBackgroundWidget(progress, this);
    } else if (this is GradientBackground) {
      return GradientBackgroundWidget(progress, this);
    }

    return this;
  }
}
