import 'package:flutter/material.dart';

import 'package:software2/helpers/responsive.dart';


class ButtonSubmit extends StatelessWidget {
  final textBoton;
  final void Function()onPressed;

  const ButtonSubmit({Key key, 
    this.textBoton = '',
    this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Container(
      child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            this.textBoton,
            style: TextStyle(color: Colors.white,
            fontSize: responsive.hp(2)
            ),
          ),
          color: Colors.pinkAccent,
          onPressed: this.onPressed
      ),
    );
  }
}