import 'package:assalomproject/core/constant/constant_color.dart';
import 'package:assalomproject/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isVisible;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final int? maxLength;
  const InputWidget(
      {super.key,
      required this.controller,
      this.label,
      this.suffixIcon,
      this.maxLength,
      this.hintText,
      this.inputFormatter,
      this.inputType,
      this.prefixIcon,
      this.isVisible});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label.toString()),
        const SizedBox(height: 7),
        TextFormField(
          maxLength: widget.maxLength,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputFormatter,
          style: Styles.style500sp16Black,
          cursorColor: ConstColor.as_salomText,
          controller: widget.controller,
          obscuringCharacter: "*",
          obscureText: widget.isVisible ?? false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon,
            prefix: widget.prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ConstColor.as_salomText,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: widget.label,
            // labelStyle: Styles.style400sp14Black,
          ),
        ),
      ],
    );
  }
}
