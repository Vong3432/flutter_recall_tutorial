import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String text;

  SecondScreen({Key? key, required this.text}) : super(key: key);

  void _backToFirstScreen(BuildContext ctx) {
    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(text),
            ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                _backToFirstScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
