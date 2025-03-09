import 'package:flutter/material.dart';


/// Light and Dark Theme For BottomSheet
class EBottomSheetTheme{
  EBottomSheetTheme._();

// Light
  static BottomSheetThemeData lightBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  //Dark
  static BottomSheetThemeData darkBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}