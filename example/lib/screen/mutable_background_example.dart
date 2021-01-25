import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const _headerColor = Color(0xFFFFEB3B);
const _imageUrl =
    'https://images.pexels.com/photos/1002543/pexels-photo-1002543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260';

class MutableBackgroundExample extends StatelessWidget {
  const MutableBackgroundExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              leading: const SizedBox(),
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.network(_imageUrl, fit: BoxFit.cover),
                collapsedColor: _headerColor,
              ),
            ),
          ),
          const ListWidget(color: _headerColor),
        ],
      ),
    );
  }
}
