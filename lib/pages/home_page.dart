import 'package:codigo6_states/controllers/post_controller.dart';
import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Lista de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => postController.isLoading.isTrue
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: postController.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(postController.posts[index]["title"]);
                },
              ),
      ),
      // ListView(
      //   children: [
      //     ListTile(
      //       title: Text("Nombre del item"),
      //       subtitle: Text("Descripcion del item"),
      //     ),
      //     ListTile(
      //       title: Text("Nombre del item"),
      //       subtitle: Text("Descripcion del item"),
      //     ),
      //   ],
      // ),
    );
  }
}
