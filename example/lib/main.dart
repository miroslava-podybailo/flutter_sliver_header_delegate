import 'package:example/screen/customized_children_example.dart';
import 'package:example/screen/gradient_background_example.dart';
import 'package:example/screen/image_text_background_example.dart';
import 'package:example/screen/modified_title_example.dart';
import 'package:example/screen/mutable_background_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Button(
              text: 'Mutable background',
              route: MutableBackgroundExample(),
            ),
            const _Button(
              text: 'Image & Text background',
              route: ImageTextBackgroundExample(),
            ),
            const _Button(
              text: 'Gradient background',
              route: GradientBackgroundExample(),
            ),
            const _Button(
              text: 'Modified title',
              route: const ModifiedTitleExample(),
            ),
            const _Button(
              text: 'Customized items',
              route: const CustomizedChildrenExample(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    @required this.text,
    @required this.route,
    Key key,
  }) : super(key: key);

  final String text;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => route),
      ),
      child: Text(text),
    );
  }
}
