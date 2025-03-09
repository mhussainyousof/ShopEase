import 'package:flutter/material.dart';

class EOutLineButtonTheme{
  EOutLineButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: BorderSide(color: Colors.blue),
      textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: BorderSide(color: Colors.blueAccent),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );
}
