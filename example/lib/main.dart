import 'package:example/screen/complete_example.dart';
import 'package:example/screen/customized_children_example.dart';
import 'package:example/screen/gradient_background_example.dart';
import 'package:example/screen/image_text_background_example.dart';
import 'package:example/screen/modified_title_example.dart';
import 'package:example/screen/mutable_background_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _Button(
              text: 'Complete Example',
              route: CompleteExample(),
            ),
            _Button(
              text: 'Mutable background',
              route: MutableBackgroundExample(),
            ),
            _Button(
              text: 'Image & Text background',
              route: ImageTextBackgroundExample(),
            ),
            _Button(
              text: 'Gradient background',
              route: GradientBackgroundExample(),
            ),
            _Button(
              text: 'Modified title',
              route: ModifiedTitleExample(),
            ),
            _Button(
              text: 'Customized items',
              route: CustomizedChildrenExample(),
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
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => route),
      ),
      child: Text(text),
    );
  }
}
