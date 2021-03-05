import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive{
  double _width, _height,_diagonal;

  bool _isTablet ;

  double get width => _width; 
  double get height => _height; 
  double get diagonal => _diagonal; 
  bool get isTable => _isTablet; 

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;

    this._diagonal = math.sqrt(math.pow(_width, 2)+math.pow(_height, 2));

    this._isTablet = size.shortestSide >= 600; 
  }

  double wp(double porcentage)=> _width * porcentage / 100;
  double hp(double porcentage)=> _height * porcentage / 100;
  double dp(double porcentage)=> _diagonal * porcentage / 100;


}