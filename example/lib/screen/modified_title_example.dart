import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const _titleColor = Color(0xFFC62828);

const _collapsedTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 24,
);

const _expandedTextStyle = TextStyle(
  color: _titleColor,
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

const _expandedPadding = EdgeInsets.symmetric(
  vertical: 12,
  horizontal: 24,
);

class ModifiedTitleExample extends StatelessWidget {
  const ModifiedTitleExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              backgroundColor: Colors.white,
              expandedHeight: 120,
              children: [
                const FlexibleTextItem(
                  text: 'Modified title',
                  expandedStyle: _expandedTextStyle,
                  collapsedStyle: _collapsedTextStyle,
                  expandedAlignment: Alignment.bottomLeft,
                  collapsedAlignment: Alignment.center,
                  expandedPadding: _expandedPadding,
                ),
              ],
            ),
          ),
          const ListWidget(color: _titleColor),
        ],
      ),
    );
  }
}
