import 'package:flutter/material.dart';

// StatelessWidget sử dụng khi không cần thay đổi trạng thái của widget
class SendText extends StatelessWidget {
  const SendText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Column(
        children: [
          Expanded(flex: 1, child: _createHeader()),
          Expanded(flex: 9, child: _createBody()),
        ],
      ),
    );
  }
}

// dinh nghia cac widget nho cho man hinh
Widget _createHeader() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Center(
      child: Row(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Send")),
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextField(decoration: InputDecoration()),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _createBody() {
  return Container(color: Colors.red);
}
