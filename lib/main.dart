import 'package:flutter/material.dart';
import 'package:shop_ease/utils/theme/theme.dart';

void main() async{
  await Future.delayed(const Duration(seconds: 2));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
    );
  }
}