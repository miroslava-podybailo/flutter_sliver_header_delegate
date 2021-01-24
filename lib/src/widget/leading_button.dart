import 'package:flutter/material.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    this.leading,
    Key key,
  }) : super(key: key);

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: leading ??
          (Navigator.of(context).canPop()
              ? const BackButton()
              : const SizedBox()),
    );
  }
}
