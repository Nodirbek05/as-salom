import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? label;
  final AutovalidateMode? validateMode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isVisible;
  final String? hintText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle;
 
  const InputWidget(
      {super.key,
      required this.controller,
      this.label,
      this.validator,
      this.maxLines,
      this.validateMode,
      this.suffixIcon,
      this.maxLength,
      this.hintText,
      this.inputFormatter,
      this.inputType,
      this.prefixIcon,
      this.padding,
      this.hintStyle,
      this.isVisible});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatter,
      style: Styles.style500sp16Black,
      cursorColor: ConstColor.assalomText,
      controller: widget.controller,
      obscuringCharacter: "*",
      obscureText: widget.isVisible ?? false,
      decoration: InputDecoration(
        
        hintStyle: widget.hintStyle,
        contentPadding: widget.padding,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ConstColor.assalomText,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ConstColor.assalomText,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ConstColor.redColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
    
        // labelText: widget.label,
        // labelStyle: Styles.style400sp14Black,
      ),
    );
  }
}
