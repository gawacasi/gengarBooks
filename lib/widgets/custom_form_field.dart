import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gengarfilm/common/style_colors.dart';

class CustomFormField extends StatefulWidget {
  final String? hintTxt;
  final String? labelTxt;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLenght;
  final TextInputAction? txtInputAction;
  final EdgeInsetsGeometry? padding;
  final TextCapitalization? txtCapitalization;
  final Widget? suffixIcon;
  final bool? obscureTxt;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;
  final String? helperTxt;

  const CustomFormField({
    Key? key,
    this.hintTxt,
    this.labelTxt,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.maxLenght,
    this.txtInputAction,
    this.padding,
    this.txtCapitalization,
    this.suffixIcon,
    this.obscureTxt,
    this.inputFormatter,
    this.validator,
    this.helperTxt,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final defaultBorder = const OutlineInputBorder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        obscureText: widget.obscureTxt ?? false,
        textCapitalization: widget.txtCapitalization ?? TextCapitalization.none,
        textInputAction: widget.txtInputAction,
        maxLength: widget.maxLenght,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          helperText: widget.helperTxt,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintTxt,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelTxt,
          border: defaultBorder,
          focusedBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.purpleBase,
            ),
          ),
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          enabledBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.strongPurpleBase,
            ),
          ),
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
