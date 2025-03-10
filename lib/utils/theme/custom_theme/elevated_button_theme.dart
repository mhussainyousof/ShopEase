import 'package:flutter/material.dart';


/// Light and Dark Theme for ElevatedButton

class EElevatedButtonTheme{
  EElevatedButtonTheme._();


// Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(
        color: Colors.blue,
      ),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );


//Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(
        color: Colors.blue,
      ),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
}