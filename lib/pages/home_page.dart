import 'package:codigo6_states/pages/register_page.dart';
import 'package:codigo6_states/provider/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Se referencia el provider en este widget actual
    ExampleProvider exampleProvider = Provider.of<ExampleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
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
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripción del item"),
          ),
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripción del item"),
          ),
          // Text(
          //   //Accedemos al contador del provider
          //   context.watch<ExampleProvider>().contador.toString(),
          // ),
          // Text(
          //   exampleProvider.contador.toString(),
          // ),
          Consumer<ExampleProvider>(
            //widget consumer sirver para reconstruir solo la parte que mostrara data del provider
            builder: (context, provider, _) {
              return Text(
                provider.contador.toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}
