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
    this.keyboardType = TextInputType.text,
    this.onSubmit,
    this.label,
  })

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Padding(
      padding: const EdgeInsets.only(
        bottom: 10
      ),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        onSubmitted: onSubmit,
        placeholder: label,
        padding: EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12
        ),
      ),
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