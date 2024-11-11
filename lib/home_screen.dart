import 'package:connectivity_check_demo/network_connectivity.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Network connectivity checker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              if (await isNetworkAvailable()) {
                print("Network Available");
              } else {
                print('Network not available');
              }
            },
            child: const Text(
              'Check Network',
            )),
      ),
    );
  }
}
