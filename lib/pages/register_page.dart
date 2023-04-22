import 'package:codigo6_states/cubit/counter/counter_cubit.dart';
import 'package:codigo6_states/pages/register_bloc.dart';
import 'package:codigo6_states/provider/example_provider.dart';
import 'package:codigo6_states/provider/person_provider.dart';
import 'package:codigo6_states/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerBloc = RegisterBloc();

  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
  }

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
            // ElevatedButton(
            //   onPressed: () {
            //     //Los tres bloques hacen lo mismo
            //     // ExampleProvider exampleProvider =
            //     //     Provider.of<ExampleProvider>(context, listen: false);
            //     // exampleProvider.agregaContador();

            //     // Provider.of<ExampleProvider>(context, listen: false)
            //     //     .agregaContador();
            //     //context.read<ExampleProvider>().agregaContador();
            //     print(personController.text);
            //     PersonProvider personProvider =
            //         Provider.of<PersonProvider>(context, listen: false);
            //     personProvider.addPerson(personController.text);
            //   },
            //   child: const Text(
            //     "Registrar",
            //   ),
            // ),

            BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, CounterState state) {
                print(state.runtimeType);
                switch (state.runtimeType) {
                  case CounterInitState:
                    int value = (state as CounterInitState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    );
                  case IncrementState:
                    int value = (state as IncrementState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    );
                  case DecrementState:
                    int value = (state as DecrementState).data;
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 80,
                      ),
                    );
                  default:
                    return const Center();
                }
              },
            ),

            ElevatedButton(
              onPressed: () {
                //registerBloc.addCounter(IncrementEvent(10));
                context.read<CounterCubit>().increment();
              },
              child: const Text(
                "Registrar",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // registerBloc.addCounter(IncrementEvent(10));
                context.read<CounterCubit>().decrement();
              },
              child: const Text(
                "Registrar",
              ),
            ),

            // StreamBuilder(
            //   stream: registerBloc.stream,
            //   builder: (BuildContext context, AsyncSnapshot snap) {
            //     if (snap.hasData) {
            //       return Text(
            //         snap.data.toString(),
            //         style: TextStyle(
            //           fontSize: 40.0,
            //         ),
            //       );
            //     }
            //     return Text(
            //       "0",
            //       style: TextStyle(
            //         fontSize: 40.0,
            //       ),
            //     );
            //   },
            // ),

            // Text(
            //   //Accedemos al contador del provider
            //   context.watch<ExampleProvider>().contador.toString(),
            // ),
            // Consumer<ExampleProvider>(
            //   //widget consumer sirver para reconstruir solo la parte que mostrara data del provider
            //   builder: (context, provider, _) {
            //     return Text(
            //       provider.contador.toString(),
            //     );
            //   },
            // ),
            // Consumer<PostProvider>(
            //   builder: (context, provider, _) {
            //     return Text(provider.posts.toString());
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
