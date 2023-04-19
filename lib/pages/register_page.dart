import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Registro"),
      ),
      body: Column(
        children: [
          TextField(),
          SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Registrar"),
          ),
        ],
      ),
    );
  }
}
