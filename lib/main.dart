import 'package:codigo6_states/pages/home_page.dart';
import 'package:codigo6_states/provider/example_provider.dart';
import 'package:codigo6_states/provider/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Registrar a los providers usados en el app
        ChangeNotifierProvider(create: (context) => PersonProvider()),
        ChangeNotifierProvider(create: (context) => ExampleProvider()),
      ],
      child: MaterialApp(
        title: 'Provider App',
        home: HomePage(),
      ),
    );
  }
}
