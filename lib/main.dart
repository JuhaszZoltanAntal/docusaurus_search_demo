import 'package:docusaurus_search_demo/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Docusaurus Search Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff242526),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}
