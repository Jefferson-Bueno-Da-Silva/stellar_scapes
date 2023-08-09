import 'package:flutter/material.dart';
import 'package:stellar_scapes/components/card.dart';

class MyHomePage extends StatefulWidget {
  final String title = "Astronomy Picture of the Day";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: 24.0),
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: MyCardComponent(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: MyCardComponent(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: MyCardComponent(),
            ),
          ],
        ));
  }
}
