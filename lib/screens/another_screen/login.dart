import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _index = 0;

  void _onPressed(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: IndexedStack(
              index: _index,
              children: [
                Container(color: Colors.red),
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.grey),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _onPressed(0);
                  },
                  icon: Icon(Icons.star),
                ),
                IconButton(
                  onPressed: () {
                    _onPressed(1);
                  },
                  icon: Icon(Icons.alarm),
                ),
                IconButton(
                  onPressed: () {
                    _onPressed(2);
                  },
                  icon: Icon(Icons.ad_units),
                ),
                IconButton(
                  onPressed: () {
                    _onPressed(3);
                  },
                  icon: Icon(Icons.start),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
