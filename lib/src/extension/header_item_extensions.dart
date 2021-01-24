import 'package:flutter/material.dart';
import 'package:sliver_flutter/sliver_flutter.dart';

extension XHeaderItem on FlexibleHeaderItem {
  EdgeInsets paddingValue(double progress) => EdgeInsets.lerp(
        expandedPadding ?? padding,
        collapsedPadding ?? padding,
        progress,
      );

  EdgeInsets marginValue(double progress) => EdgeInsets.lerp(
        expandedMargin ?? margin,
        collapsedMargin ?? margin,
        progress,
      );

  Alignment alignmentValue(double progress) => Alignment.lerp(
        expandedAlignment ?? alignment,
        collapsedAlignment ?? alignment,
        progress,
      );
}
