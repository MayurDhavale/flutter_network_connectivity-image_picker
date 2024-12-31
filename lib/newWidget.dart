import 'package:flutter/material.dart';

class Newwidget extends StatefulWidget {
  const Newwidget({super.key});

  @override
  State<Newwidget> createState() => _NewwidgetState();
}

class _NewwidgetState extends State<Newwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Widget Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              label: Text('Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
