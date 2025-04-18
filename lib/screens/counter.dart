import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/cubit/count_blog.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"), centerTitle: true),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("press many times"),
                const SizedBox(height: 20),
                Text("${state.count}", style: const TextStyle(fontSize: 40)),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementCount());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
