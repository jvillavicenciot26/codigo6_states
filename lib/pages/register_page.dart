import 'package:codigo6_states/provider/example_provider.dart';
import 'package:codigo6_states/provider/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController personController = TextEditingController();
    //context.watch sirve para ver los datos del provider
    //context.read sirve para ejecutar los metodos del provider

    //Se referencia el provider en este widget actual
    //ExampleProvider exampleProvider = Provider.of<ExampleProvider>(context);
    //liste: false, hace que el provider no este siempre escuchando pero si podra ejecutar metodos,
    //asi se evita que se reconstruya todo el build y podemos usar los metodos del provider
    // ExampleProvider exampleProvider =
    //     Provider.of<ExampleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: personController,
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {
                //Los tres bloques hacen lo mismo
                // ExampleProvider exampleProvider =
                //     Provider.of<ExampleProvider>(context, listen: false);
                // exampleProvider.agregaContador();

                // Provider.of<ExampleProvider>(context, listen: false)
                //     .agregaContador();
                //context.read<ExampleProvider>().agregaContador();
                print(personController.text);
                PersonProvider personProvider =
                    Provider.of<PersonProvider>(context, listen: false);
                personProvider.addPerson(personController.text);
              },
              child: const Text(
                "Registrar",
              ),
            ),
            // Text(
            //   //Accedemos al contador del provider
            //   context.watch<ExampleProvider>().contador.toString(),
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
      ),
    );
  }
}
