import 'package:codigo6_states/bloc/posts/post_bloc.dart';
import 'package:codigo6_states/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        title: 'States App',
        home: HomePage(),
      ),
    );
  }
}
