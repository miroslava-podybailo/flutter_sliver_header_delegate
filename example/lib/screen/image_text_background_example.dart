import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const imageUrl =
    'https://www.theuiaa.org/wp-content/uploads/2017/12/2018_banner.jpg';

class ImageTextBackgroundExample extends StatelessWidget {
  const ImageTextBackgroundExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              leading: const SizedBox(),
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                collapsedColor: Colors.lightGreen,
              ),
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Mountains',
                    style: theme.textTheme.headline4.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ListWidget(
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
