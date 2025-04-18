import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/app.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/firebase_options.dart';


void main() async {
await GetStorage.init();
final WidgetsBinding widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();

FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

runApp(const App());
}

