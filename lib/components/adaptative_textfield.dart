import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmit;
  final String label;

  AdaptativeTextField({
    this.controller,
    this.keyboardType,
    this.onSubmit,
    this.label,
  })

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoTextField(

    ) : TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmit,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}