import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class AuthTextField extends StatefulWidget{
  final String textLabel;
  final String textHint;
  final bool isPassword;
  const AuthTextField({super.key,required this.textLabel, required this.textHint, required this.isPassword});
  @override
  State<StatefulWidget> createState() => _AuthTextField();

}

class _AuthTextField extends State<AuthTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 60,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: MainTheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      child: TextField(
        obscureText: widget.isPassword,
        cursorColor: MainTheme.primary,
        style: TextStyle(
            color: MainTheme.primary,
            fontSize: 12.0
        ),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: MainTheme.transparent
                )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:MainTheme.primary),
            ),
            labelStyle: TextStyle(
                color: MainTheme.helper,
                fontSize: 12.0
            ),
            label: Text(widget.textLabel),
            hintText:  widget.textHint,
            hintStyle: TextStyle(
                color: MainTheme.helper,
                fontSize: 10.0
            )
        ),
      ),
    );
  }

}