import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    this.color = Colors.black,
    Key key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 12,
      children: List<Widget>.generate(
        20,
        (index) => Container(
          margin: EdgeInsets.only(
            top: 8,
            left: index % 2 == 0 ? 8 : 0,
            right: index % 2 == 0 ? 0 : 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.7),
                blurRadius: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
