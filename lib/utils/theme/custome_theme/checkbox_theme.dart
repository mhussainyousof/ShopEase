import 'package:flutter/material.dart';


/// CheckBox Light And Dark Theme
///
class ECheckBoxTheme{
  ECheckBoxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
    }}),

    fillColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );

//
//
//

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }}),

    fillColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );
}