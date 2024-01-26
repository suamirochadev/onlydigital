import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onlydigital/src/pages/auth/sign_in_screen.dart';
import 'package:onlydigital/src/config/custom_colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyDigital',
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
      //     colorScheme: ColorScheme.fromSeed(
      //         seedColor: Colors.black,
      //         brightness: Brightness.dark
      //         )),
      theme: ThemeData(
        fontFamily: 'OpenSans',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: CustomColors.customSwatchColor),
        scaffoldBackgroundColor: Colors.white.withAlpha(10),
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
