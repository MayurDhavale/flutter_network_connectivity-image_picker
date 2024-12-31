import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class CopyTextClipboard extends StatefulWidget {
  const CopyTextClipboard({super.key});

  @override
  State<CopyTextClipboard> createState() => _CopyTextClipboardState();
}

class _CopyTextClipboardState extends State<CopyTextClipboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Text Copy Clipbaord ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            FlutterClipboard.copy('Copy Text').then((value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Text Copied')));
            });
          },
          child: Text(
            'SILICON STACK',
            // ignore: deprecated_member_use
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
