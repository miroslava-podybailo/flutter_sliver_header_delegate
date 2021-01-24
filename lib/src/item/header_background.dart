import 'package:flutter/material.dart';

abstract class HeaderBackground extends Widget {
  @override
  Element createElement() =>
      throw Exception('Unable to wrap $this with other widgets');
}
