import 'package:flutter/material.dart';
import 'screens/home_page/home.dart';

class CoffeShopApp extends StatelessWidget {
  const CoffeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(243, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
