import 'package:codigo6_states/bloc/posts/post_bloc.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Registrar",
              ),
            ),
            BlocBuilder<PostBloc, PostState>(
              builder: (BuildContext context, PostState state) {
                if (state is PostInitState || state is PostLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PostSuccedState) {
                  List posts = state.data;
                  return Text(posts.toString());
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
