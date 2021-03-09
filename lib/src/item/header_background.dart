import 'package:flutter/material.dart';

abstract class HeaderBackground extends Widget {
  const HeaderBackground({Key? key}) : super(key: key);

  @override
  Element createElement() =>
      throw Exception('Unable to wrap $this with other widgets');
}
