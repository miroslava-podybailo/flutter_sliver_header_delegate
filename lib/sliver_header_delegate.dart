library sliver_flutter;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/src/extension/widget_extension.dart';
import 'package:sliver_header_delegate/src/item/header_background.dart';
import 'package:sliver_header_delegate/src/widget/leading_button.dart';

// TODO FlexibleBuilder
typedef FlexibleBuilder = Widget Function(
  BuildContext context,
  double progress,
);

// TODO FlexibleHeaderDelegate
class FlexibleHeaderDelegate extends SliverPersistentHeaderDelegate {
  FlexibleHeaderDelegate({
    this.collapsedHeight = kToolbarHeight,
    this.expandedHeight = kToolbarHeight * 3,
    this.children,
    this.backgroundColor,
    this.background,
    this.collapsedElevation = 8,
    this.expandedElevation = 0,
    this.leading,
    this.builder,
    this.statusBarHeight = 0,
  });

  final double expandedHeight;
  final double collapsedHeight;
  final List<Widget> children;
  final Color backgroundColor;
  final Widget background;
  final double expandedElevation;
  final double collapsedElevation;
  final Widget leading;
  final FlexibleBuilder builder;

  final double statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final offset = min(shrinkOffset, maxExtent - minExtent);
    final double progress = offset / (maxExtent - minExtent);

    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);

    return Material(
      elevation: progress < 1 ? expandedElevation : collapsedElevation,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (background != null) background.transform(progress),
          Container(
            height: visibleMainHeight,
            padding: EdgeInsets.only(top: statusBarHeight),
            color: backgroundColor ?? Theme.of(context).appBarTheme.color,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (builder != null) builder(context, progress),
                if (children != null)
                  ...children.map((item) => item.transform(progress)).toList(),
                LeadingButton(leading: leading),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + statusBarHeight;

  @override
  double get minExtent => collapsedHeight + statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

// TODO MutableBackground
class MutableBackground extends HeaderBackground {
  MutableBackground({
    this.expandedWidget,
    this.expandedColor,
    this.collapsedWidget,
    this.collapsedColor,
    this.animationDuration = const Duration(milliseconds: 150),
  })  : assert(expandedColor == null || expandedWidget == null),
        assert(collapsedColor == null || collapsedWidget == null);

  final Widget expandedWidget;
  final Widget collapsedWidget;
  final Color expandedColor;
  final Color collapsedColor;
  final Duration animationDuration;
}

// TODO GradientBackground
class GradientBackground extends HeaderBackground {
  GradientBackground({@required this.gradient, this.modifyGradient = true});

  final Gradient gradient;
  final bool modifyGradient;
}

//TODO HeaderItemOptions
enum HeaderItemOptions {
  scale,
  hide,
}

//TODO FlexibleHeaderItem
class FlexibleHeaderItem extends Widget {
  FlexibleHeaderItem({
    this.child,
    this.alignment,
    this.expandedAlignment,
    this.collapsedAlignment,
    this.padding,
    this.expandedPadding,
    this.collapsedPadding,
    this.margin,
    this.expandedMargin,
    this.collapsedMargin,
    this.options = const [],
  })  : assert(alignment == null ||
            (expandedAlignment == null && collapsedAlignment == null)),
        assert(padding == null ||
            (expandedPadding == null && collapsedPadding == null)),
        assert(margin == null ||
            (expandedMargin == null && collapsedMargin == null));

  final Alignment alignment;
  final Alignment expandedAlignment;
  final Alignment collapsedAlignment;

  final EdgeInsets padding;
  final EdgeInsets expandedPadding;
  final EdgeInsets collapsedPadding;

  final EdgeInsets margin;
  final EdgeInsets expandedMargin;
  final EdgeInsets collapsedMargin;

  final List<HeaderItemOptions> options;

  final Widget child;

  @override
  Element createElement() =>
      throw Exception('Unable to wrap $this with other widgets');
}

// TODO FlexibleTextItem
class FlexibleTextItem extends FlexibleHeaderItem {
  FlexibleTextItem({
    @required this.text,
    this.collapsedStyle,
    this.expandedStyle,
    Alignment alignment,
    Alignment expandedAlignment,
    Alignment collapsedAlignment,
    EdgeInsets padding,
    EdgeInsets expandedPadding,
    EdgeInsets collapsedPadding,
    EdgeInsets margin,
    EdgeInsets expandedMargin,
    EdgeInsets collapsedMargin,
    List<HeaderItemOptions> options = const [],
  }) : super(
          alignment: alignment,
          expandedAlignment: expandedAlignment,
          collapsedAlignment: collapsedAlignment,
          padding: padding,
          expandedPadding: expandedPadding,
          collapsedPadding: collapsedPadding,
          margin: margin,
          expandedMargin: expandedMargin,
          collapsedMargin: collapsedMargin,
          options: options,
        );

  final String text;

  final TextStyle collapsedStyle;
  final TextStyle expandedStyle;
}
