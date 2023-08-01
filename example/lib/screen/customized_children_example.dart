import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import '../widget/list_widget.dart';

const _headerColor = Color(0xFFB0BEC5);
const _expandedPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 20);

class CustomizedChildrenExample extends StatelessWidget {
  const CustomizedChildrenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              leading: const SizedBox(),
              backgroundColor: _headerColor,
              children: [
                FlexibleHeaderItem(
                  options: const [HeaderItemOptions.hide],
                  alignment: Alignment.centerRight,
                  expandedPadding: _expandedPadding,
                  child: _DartLogo(),
                ),
                FlexibleHeaderItem(
                  options: const [HeaderItemOptions.scale],
                  alignment: Alignment.centerLeft,
                  expandedPadding: _expandedPadding,
                  child: _FlutterLogo(),
                ),
              ],
            ),
          ),
          const ListWidget(color: _headerColor),
        ],
      ),
    );
  }
}

class _FlutterLogo extends StatelessWidget {
  static const _logoUrl =
      'https://plugins.jetbrains.com/files/13666/100004/icon/pluginIcon.png';

  @override
  Widget build(BuildContext context) {
    return Image.network(_logoUrl);
  }
}

class _DartLogo extends StatelessWidget {
  static const _logoUrl =
      'https://assets.stickpng.com/thumbs/5847f289cef1014c0b5e486b.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Image.network(_logoUrl),
    );
  }
}
