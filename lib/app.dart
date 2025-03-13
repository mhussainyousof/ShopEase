import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_ease/common/widgets/success_screen/success_screen.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shop_ease/features/authentication/screens/signup/verify_email.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/theme/theme.dart';

import 'bindings/bindings.dart';
/*
 ╔════════════════════════════════════════╗
 ║    ✨ App by Hussian Yousof ✨         ║
 ║    📅 Date: 2025                       ║
 ║    🚀 Clean Code | Flutter Dev         ║
 ╚════════════════════════════════════════╝
*/

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,

      initialBinding: GeneralBindings(),
      home: ForgetPassword()
    );
  }
}
