import 'package:codigo6_states/cubit/counter/counter_cubit.dart';
import 'package:codigo6_states/cubit/posts/post_cubit.dart';
import 'package:codigo6_states/pages/home_page.dart';
import 'package:codigo6_states/provider/example_provider.dart';
import 'package:codigo6_states/provider/note_provider.dart';
import 'package:codigo6_states/provider/person_provider.dart';
import 'package:codigo6_states/provider/post_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Registrar a los providers usados en el app
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => PostCubit()),
      ],
      child: MaterialApp(
        title: 'Provider App',
        home: HomePage(),
      ),
    );
    // MultiProvider(
    //   providers: [
    //     //Registrar a los providers usados en el app
    //     ChangeNotifierProvider(create: (context) => PersonProvider()),
    //     ChangeNotifierProvider(create: (context) => ExampleProvider()),
    //     ChangeNotifierProvider(create: (context) => PostProvider()),
    //     ChangeNotifierProvider(create: (context) => NoteProvider()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Provider App',
    //     home: HomePage(),
    //   ),
    // );
  }
}
