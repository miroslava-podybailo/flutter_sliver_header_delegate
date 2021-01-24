import 'package:example/widget/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_flutter/sliver_flutter.dart';

const _headerColor = Color(0xFF00796B);
const _itemKey = Key('myItem');

class TransformChildExample extends StatelessWidget {
  const TransformChildExample({Key key}) : super(key: key);

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
              backgroundColor: _headerColor,
              leading: const SizedBox(),
              children: [
                // FlexibleHeaderItem(
                //   expandedChild: const _SearchField(),
                //   collapsedChild: const _Icon(),
                //   collapsedAlignment: Alignment.centerRight,
                //   expandedAlignment: Alignment.bottomLeft,
                // ),
              ],
            ),
          ),
          const ListWidget(color: _headerColor),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 16),
          _Icon(padding: 0),
          const SizedBox(width: 16),
          Text(
            'Search...',
            style: const TextStyle(fontSize: 28, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    this.padding = 24,
    Key key,
  }) : super(key: key);

  final double padding;

  @override
  Widget build(BuildContext context) => Container(
        key: _itemKey,
        padding: EdgeInsets.all(padding),
        child: Icon(
          Icons.search,
          color: Colors.blue,
          size: 32,
        ),
      );
}
