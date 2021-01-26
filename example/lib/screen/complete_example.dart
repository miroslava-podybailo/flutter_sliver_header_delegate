import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const primaryColor = const Color(0xBE7A81FF);

class CompleteExample extends StatelessWidget {
  const CompleteExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
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
                  'https://loadedlandscapes.com/wp-content/uploads/2019/07/lighting.jpg',
                  fit: BoxFit.cover,
                ),
                collapsedColor: primaryColor,
              ),
              builder: (context, progress) {
                return Container(
                  child: Text(
                    'Mountains',
                    style: theme.textTheme.headline4.copyWith(
                      fontSize: Tween<double>(
                        begin: theme.textTheme.headline4.fontSize,
                        end: theme.textTheme.headline6.fontSize,
                      ).lerp(progress),
                      fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w600, progress),
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.bottomCenter, progress),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                );
              },
            ),
          ),
          const ListWidget(
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
