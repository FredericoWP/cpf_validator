import 'package:cpf_validator/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
              primary: Colors.blue, secondary: Colors.blueGrey)),
      home: const HomePage(),
    );
  }
}