import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/cubit/calculator_cubit/option_calculator_bloc.dart';

class CalculatorOperations extends StatefulWidget {
  const CalculatorOperations({super.key, required this.title});
  final String title;

  @override
  State<CalculatorOperations> createState() => _CalculatorOperationsState();
}

class _CalculatorOperationsState extends State<CalculatorOperations> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(flex: 4, child: _createHeader()),
          Expanded(flex: 2, child: _createResultWidget()),
          Expanded(flex: 2, child: _createButtonWidget(context)),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "A",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "B",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createResultWidget() {
    return BlocBuilder<OptionCalculatorBloc, OptionCalculatorState>(
      builder: (context, state) {
        String result = "Result";
        print("debug: $state");
        if (state is ResultState) {
          result = state.result;
          print("here");
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              result,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _createButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  final double a = double.tryParse(_aController.text) ?? 0.0;
                  final double b = double.tryParse(_bController.text) ?? 0.0;
                  context.read<OptionCalculatorBloc>().add(AddEvent(a, b));
                },
                child: const Text("+"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  final double a = double.tryParse(_aController.text) ?? 0.0;
                  final double b = double.tryParse(_bController.text) ?? 0.0;
                  context.read<OptionCalculatorBloc>().add(SubtractEvent(a, b));
                },
                child: const Text("-"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  final double a = double.tryParse(_aController.text) ?? 0.0;
                  final double b = double.tryParse(_bController.text) ?? 0.0;
                  context.read<OptionCalculatorBloc>().add(MultiplyEvent(a, b));
                },
                child: const Text("*"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  final double a = double.tryParse(_aController.text) ?? 0.0;
                  final double b = double.tryParse(_bController.text) ?? 0.0;
                  context.read<OptionCalculatorBloc>().add(DivideEvent(a, b));
                },
                child: const Text("/"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
