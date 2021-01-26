import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const _startColor = Color(0xFF233329);
const _endColor = Color(0xFF63D471);

class GradientBackgroundExample extends StatelessWidget {
  const GradientBackgroundExample({Key key}) : super(key: key);

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
              background: GradientBackground(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _startColor,
                    _endColor,
                  ],
                ),
              ),
            ),
          ),
          const ListWidget(color: _startColor),
        ],
      ),
    );
  }
}
