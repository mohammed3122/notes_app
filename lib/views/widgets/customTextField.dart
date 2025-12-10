import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/functions/build_border.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.isPassword,
    this.hideText = false,
    this.hasWidth = false,
    this.maxLines = 1,
    required this.keyboardType,
    // required this.myController,
    required this.onSaved,
  });

  final String hintText;
  final String labelText;
  final Widget prefixIcon;
  final bool isPassword;
  final bool hideText;
  final Function(String?) onSaved;
  // final TextEditingController myController;
  final TextInputType keyboardType;
  final int maxLines;
  final bool hasWidth;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _hideText = widget.hideText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: widget.hasWidth
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: TextFormField(
          maxLines: widget.maxLines,
          onSaved: widget.onSaved,
          validator: (data) {
            if (data?.isEmpty ?? true) {
              return 'this field is required';
            } else {
              return null;
            }
            // ""
            // null
          },
          // controller: widget.myController,
          obscureText: _hideText,
          keyboardType: widget.keyboardType,
          cursorColor: kMainColor,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _hideText = !_hideText;
                      });
                    },
                    icon: _hideText == true
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            labelStyle: TextStyle(color: Color(0xff53ebd6), fontSize: 23),
            filled: true,
            // ignore: deprecated_member_use
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kMainColor),
          ),
        ),
      ),
    );
  }
}
