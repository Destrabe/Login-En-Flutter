import 'package:app/auth/login_o_register.dart';
import 'package:app/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuse',
      debugShowCheckedModeBanner: false,
      home: LoginORegister(),
      theme: LightMode,
    );
  }
}