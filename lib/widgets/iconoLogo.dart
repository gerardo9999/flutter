import 'package:flutter/material.dart';


class IconContainer extends StatelessWidget {

  final double size;
  const IconContainer({Key key,@required this.size}) :
  assert(size!=null && size > 0), 
  super(key :key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius : BorderRadius.circular(this.size*0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: 15,
            offset: Offset(0,15)
          )
        ]
      ),
      padding: EdgeInsets.all(this.size*0.15),
      child: Center(child: 
        Image.asset('assets/images/medica.png',
          width: this.size * 2.5,
          height: this.size * 2.5,
        )
        ),
    );
  }
}

          
