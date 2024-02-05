import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: TestScreen()
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  final controller = TextEditingController();
  int textCounter = 0;
  
  _printvalue() {
    print('_printValue(): ${controller.text}');
    setState(() {textCounter = controller.text.length;});
  }
  
  @override
  void initState() {
    super.initState();
    controller.addListener(_printvalue);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build....');
    return Column(
      children: [
        Text('TextField Test'),
        TextField(
          style: TextStyle(fontSize: 15.0),
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Data',
            prefixIcon: Icon(Icons.input),
            border: OutlineInputBorder(),
            hintText: 'Hint Text',
            helperText: 'Input the Data.',
            counterText: '$textCounter characters'
          ),
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.emailAddress,
          minLines: 5,
          maxLines: 5,
        )
      ],
    );
  }
}