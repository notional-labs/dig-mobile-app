import 'package:flutter/material.dart';

class DigExtension{}

extension TextEditingControllerExt on TextEditingController {
  void clear() {
    this.text = '';
  }
}
