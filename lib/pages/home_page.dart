import 'package:codigo6_states/pages/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: ListView(
        children: [
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripcion del item"),
          ),
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripcion del item"),
          ),
        ],
      ),
    );
  }
}
