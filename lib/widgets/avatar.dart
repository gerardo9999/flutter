
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final sizeImage;
  final image;

  const Avatar({Key key,
    this.sizeImage,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children :<Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black26,
                offset: Offset(0,20)
              )
            ]
          ),
          child:  
          ClipOval(
            child: Image.network('https://png.pngtree.com/png-vector/20190710/ourlarge/pngtree-user-vector-avatar-png-image_1541962.jpg',
              width: this.sizeImage,
              height: this.sizeImage,
            )
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(30),
            child: Container(

              child: Icon(Icons.add, color: Colors.white,),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,  
                )
              ),

            ),
            onPressed: (){

            },
          ),
        ),
      ] 
    );
  }
}