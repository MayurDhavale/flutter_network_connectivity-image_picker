import 'package:flutter/material.dart';

class SnackbarWidget extends StatefulWidget {
  const SnackbarWidget({super.key});

  @override
  State<SnackbarWidget> createState() => _SnackbarWidgetState();
}

class _SnackbarWidgetState extends State<SnackbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('SnackBar'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                final snackbar = SnackBar(
                  action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(milliseconds: 3000),
                  backgroundColor: Colors.grey,
                  content: Text('This is a Error!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: Text('Show SnackBar')),
        ),
      ),
    );
  }
}
