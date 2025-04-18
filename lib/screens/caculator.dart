import 'package:flutter/material.dart';
import 'package:hello/screens/operations.dart';

// StatefulWidget sử dụng khi cần thay đổi trạng thái của widget
// StatefulWidget là một widget có thể thay đổi trạng thái của nó trong quá trình chạy ứng dụng
class Caculator extends StatefulWidget {
  const Caculator({super.key, required this.title});
  final String title;

  @override
  _CaculatorState createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  TextEditingController _result = TextEditingController(text: "0.0");

  var operationscren = Operations(a: 0, b: 0, title: "Operator");

  void _pushAAndB() async {
    double a = double.tryParse(_aController.text.trim()) ?? 0.0;
    double b = double.tryParse(_bController.text.trim()) ?? 0.0;

    //print("a: $a, b: $b");
    String title = "Operator";
    operationscren.a = a;
    operationscren.b = b;
    operationscren.title = title;
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => operationscren,
        //builder: (context) => Operations(title: title, a: a, b: b),
      ),
    );

    if (result != null) {
      setState(() {
        _result = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(flex: 4, child: _createHeader(_aController, _bController)),
          Expanded(flex: 2, child: _createChooseOperationWidgit(_pushAAndB)),
          Expanded(flex: 2, child: _createResultWidgit(_result)),
        ],
      ),
    );
  }
}

Widget _createHeader(
  TextEditingController aController,
  TextEditingController bController,
) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              controller: aController,
              decoration: InputDecoration(
                labelText: "a",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          Expanded(
            flex: 1,
            child: TextField(
              controller: bController,
              decoration: InputDecoration(
                labelText: "b",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _createChooseOperationWidgit(void Function() onPressed) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text("Choose operator"),
      ),
    ),
  );
}

Widget _createResultWidgit(TextEditingController result) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: result,
        decoration: InputDecoration(
          labelText: "b",
          border: OutlineInputBorder(),
        ),
        readOnly: true,
      ),
    ),
  );
}
