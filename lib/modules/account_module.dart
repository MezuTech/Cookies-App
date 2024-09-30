import 'package:flutter/material.dart';

class AccountModule {
  final Icon? leading;
  final String text;
  final Icon trailing;

  AccountModule(
      {this.leading,
      required this.text,
      this.trailing = const Icon(Icons.arrow_forward_ios_rounded)});
}
