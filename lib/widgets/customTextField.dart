// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    Key? key,
    this.hintTxt,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  final String? hintTxt;
  final int? maxLines;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        maxLength: this.maxLength,
        maxLines: this.maxLines,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: this.hintTxt,
        ),
      ),
    );
  }
}
