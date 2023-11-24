import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              bloc: BlocProvider.of<CounterCubit>(context),
              listener: (context, state) {
                SnackBar snackBar;
                if (state.hasIncremented) {
                  // Snackbar with incremented
                  snackBar = const SnackBar(
                    content: Text('Incremented'),
                  );
                } else {
                  // Snackbar with decremented
                  snackBar = const SnackBar(
                    content: Text('Decremented'),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              builder: (context, state) {
                return Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).increment,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
