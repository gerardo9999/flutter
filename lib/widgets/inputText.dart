import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool borderEnable;
  final double fontSize;
  final void Function(String text)onChanged;
  final void Function(String text)validator;

  const InputText({
    Key key,
    this.label='',
    this.obscureText = false,
    this.keyBoardType=TextInputType.text,
    this.borderEnable = true,
    this.fontSize = 15,
    this.onChanged,
    this.validator
  }):
  super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(

        keyboardType: this.keyBoardType,
        obscureText: this.obscureText,
        style: TextStyle(fontSize: this.fontSize),
        onChanged: this.onChanged,
        validator: this.validator,
        decoration: InputDecoration(

          labelText: this.label,
          enabledBorder: this.borderEnable ? 
          UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12
              )
          )
          : InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 5),

          labelStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w500, 
          )
        ),
      );
  }
}