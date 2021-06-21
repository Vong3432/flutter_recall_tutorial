import 'package:flutter/material.dart';
import 'package:flutter_app/first.dart';

void main() => runApp(MyApp());

// boilerplate code
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: FirstScreenWidget(),
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Flutter'),
      //   ),
      //   body: MyWidget(),
      // ),
    );
  }
}

// widget class
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

// state class
// We will replace this class in each of the examples below
class _MyWidgetState extends State<MyWidget> {
  // state variable
  String _textString = 'Hello world';
  bool _checkedValue = false;

  // The State class must include this method, which builds the widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _textString,
          style: TextStyle(fontSize: 30),
        ),
        TextField(
          onChanged: (text) => _doSomething(text),
        ),
        CheckboxListTile(
          title: Text('This is title'),
          value: _checkedValue,
          onChanged: (newVal) {
            _onChecking(newVal!);
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        ElevatedButton(
          onPressed: () {
            _showAlertDialog();
          },
          child: Text('Button'),
        ),
      ],
    );
  }

  // this private method is run whenever the button is pressed
  void _doSomething(String text) {
    // Using the callback State.setState() is the only way to get the build
    // method to rerun with the updated state value.
    setState(() {
      _textString = text;
    });
  }

  void _onChecking(bool newVal) {
    setState(() {
      _checkedValue = newVal;
    });
  }

  void _showAlertDialog() {
    Widget okBtn = TextButton(
      onPressed: () {
        // close dialog
        Navigator.pop(context);
      },
      child: Text('Ok'),
    );

    // Setup AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('title'),
      content: Text('Content'),
      actions: [okBtn],
    );

    showDialog(context: context, builder: (BuildContext ctx) => alert);
  }
}
