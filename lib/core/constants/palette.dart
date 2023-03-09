import 'package:flutter/material.dart';

abstract class AppPalette {
  const AppPalette._();

  static const whiteColor = Colors.white;
  static const redColor = Colors.red;
  static const transparentColor = Colors.transparent;

  static const errorColor = Color.fromRGBO(235, 87, 87, 1);
  static const blackHeadlineColor = Color.fromRGBO(30, 25, 38, 1);
  static const greyHeadlineColor = Color.fromRGBO(152, 152, 152, 1);
  static const secondaryGreyColor = Color.fromRGBO(206, 204, 223, 1);
  static const thirdGreyColor = Color.fromRGBO(245, 245, 245, 1);
  static const fourthGrayColor = Color.fromRGBO(239, 242, 247, 1);
  static const fifthGrayColor = Color.fromRGBO(227, 227, 227, 1);
  static const darkGrayColor = Color.fromRGBO(235, 238, 244, 1);
  static const mainOrangeColor = Color.fromRGBO(255, 112, 23, 1);
  static const mainBlueColor = Color.fromRGBO(23, 166, 255, 1);
}
