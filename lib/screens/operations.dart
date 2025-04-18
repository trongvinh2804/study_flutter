import 'package:flutter/material.dart';

class Operations extends StatefulWidget {
  final double? a;
  final double? b;

  const Operations({
    super.key,
    required this.title,
    required this.a,
    required this.b,
  });
  final String title;

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  @override
  Widget build(BuildContext context) {
    double $a = widget.a ?? 0.0;
    double $b = widget.b ?? 0.0;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(flex: 4, child: _createHeader($a, $b)),
          Expanded(flex: 2, child: _createChooseOperationWidgit()),
          Expanded(flex: 2, child: _createButtonWidgit(context, $a, $b)),
        ],
      ),
    );
  }
}

Widget _createHeader(double a, double b) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            readOnly: true,
            controller: TextEditingController(text: a.toString()),
            decoration: InputDecoration(
              labelText: "A",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            readOnly: true,
            controller: TextEditingController(text: b.toString()),
            decoration: InputDecoration(
              labelText: "B",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _createChooseOperationWidgit() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 80),
    child: ElevatedButton(onPressed: null, child: Text("Choose operator")),
  );
}

Widget _createButtonWidgit(BuildContext context, a, b) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                String ketqua = "$a + $b = ${a + b}";
                TextEditingController result = TextEditingController();
                result.text = ketqua;
                Navigator.pop(context, result);
              },
              child: Text("+"),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                String ketqua = "$a - $b = ${a - b}";
                TextEditingController result = TextEditingController();
                result.text = ketqua;
                Navigator.pop(context, result);
              },
              child: Text("-"),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                String ketqua = "$a * $b = ${a * b}";
                TextEditingController result = TextEditingController();
                result.text = ketqua;
                Navigator.pop(context, result);
              },
              child: Text("*"),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                String ketqua;
                TextEditingController result = TextEditingController();

                if (b == 0) {
                  ketqua = "Cannot divide by zero";
                  result.text = ketqua;
                } else {
                  ketqua = "$a / $b = ${a / b}";
                  result.text = ketqua;
                }
                Navigator.pop(context, result);
              },
              child: Text("/"),
            ),
          ),
        ),
      ],
    ),
  );
}
