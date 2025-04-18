import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hello/bloc/count_blog.dart';
import 'package:hello/cubit/calculator_cubit/option_calculator_bloc.dart';
//import 'package:hello/bloc/todo_bloc.dart';
import 'package:hello/screens/caculator.dart';
import 'package:hello/screens/calculator_bloc.dart';
import 'package:hello/screens/quan_ly_nhan_su.dart';
//import 'package:hello/screens/counter.dart';

//import 'package:hello/screens/caculator.dart';
//import 'package:hello/screens/todolist.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(bodyMedium: TextStyle()),
      ),
      home: Caculator(title: 'Calculator'),
    );

    /*return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(bodyMedium: TextStyle()),
      ),
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: const Todolist(),
      ),
    );
    */

    /*return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(bodyMedium: TextStyle()),
      ),
      home: BlocProvider(
        create: (context) => OptionCalculatorBloc(),
        child: CalculatorOperations(title: 'máy tính'),
      ),
    );
    */
  }
}
