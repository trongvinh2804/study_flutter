import 'package:flutter/material.dart';

class SearchCreen extends StatefulWidget {
  const SearchCreen({super.key, required this.title});

  final String title;

  @override
  State<SearchCreen> createState() => _SearchCreen();
}

class _SearchCreen extends State<SearchCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(color: Colors.red),
    );
  }
}
