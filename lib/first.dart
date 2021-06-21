import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/second.dart';

class FirstScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreenWidget> {
  String _title = 'Hello World';

  void _navigateToSecondPage(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          text: _title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (String text) {
                setState(() {
                  _title = text;
                });
              },
            ),
            ElevatedButton(
              child: Text('Go to second'),
              onPressed: () {
                _navigateToSecondPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
