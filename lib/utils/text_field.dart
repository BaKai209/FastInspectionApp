import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextField extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final TextEditingController controller;
  final TextInputType type;
  final Color borderColor;
  final Color? fillColor;
  final bool multiline;
  final bool obscure;
  final int maxLines;
  final int? maxLength;
  final String intialValue;
  final String hint;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onChange;
  final FormFieldValidator<String>? validator;
  final VoidCallback? prefixCallback;
  final VoidCallback? sufixCallback;

  const AppTextField({
    Key? key,
    this.width = 289,
    this.height = 45,
    this.radius = 25,
    this.borderColor = AppColors.primaryColor,
    this.fillColor,
    this.multiline = false,
    this.obscure = false,
    this.maxLines = 1,
    required this.controller,
    this.maxLength,
    this.intialValue = '',
    required this.hint,
    required this.type,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onSaved,
    this.onChange,
    this.validator,
    this.prefixCallback,
    this.sufixCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );

    return Container(
      constraints:
          BoxConstraints(minHeight: height, minWidth: width, maxWidth: width),
      child: TextFormField(
        controller: controller,
        
        style: const TextStyle(),
        initialValue: intialValue,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChange,
        autofocus: false,
        obscureText: obscure,
        cursorColor: AppColors.primaryColor,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: multiline ? TextInputType.multiline : type,
        decoration: InputDecoration(
          filled: fillColor != null,
          fillColor: fillColor,
          prefixIcon: prefixIconPath != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: 5,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: InkWell(
                      onTap: prefixCallback,
                      child: Image(
                        image: AssetImage(prefixIconPath!),
                      ),
                    ),
                  ),
                )
              : null,
          suffixIcon: suffixIconPath == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: InkWell(
                      onTap: sufixCallback,
                      child: Image(
                        image: AssetImage(suffixIconPath!),
                      ),
                    ),
                  ),
                ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
          ),
          border: border,
          errorBorder: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
