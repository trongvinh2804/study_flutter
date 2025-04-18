import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/cubit/todo_cubit/todo_bloc.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Application"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      labelText: "Add a todo",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_todoController.text.isNotEmpty) {
                      context.read<TodoBloc>().add(
                        AddTodo(_todoController.text),
                      );
                      _todoController.clear();
                    }
                  },
                  child: Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.blue[900],
                        child: ListTile(
                          title: Text(
                            state.todos[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              context.read<TodoBloc>().add(RemoveTodo(index));
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: Text("No todos yet!"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
