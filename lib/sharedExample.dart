import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedexample extends StatefulWidget {
  const Sharedexample({super.key});

  @override
  State<Sharedexample> createState() => _SharedexampleState();
}

class _SharedexampleState extends State<Sharedexample> {
  bool isDarkMode = false;
  TextEditingController namecontroller = TextEditingController();

  Future<void> updatePrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
    prefs.setString('userName', namecontroller.text);
  }

  Future<void> loadPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      namecontroller.text = prefs.getString('userName') ?? 'Guest';
    });
  }

  @override
  void initState() {
    
    loadPrefrence();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SharedPrefrence Example'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                updatePrefrence();
              },
            ),
            TextField(
              controller: namecontroller,
              onChanged: (value) {
                updatePrefrence();
              },
              decoration: InputDecoration(
                  hintText: 'UserName',
                  label: Text('username'),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text('Welcome ${namecontroller.text}'),
          ],
        ),
      ),
    );
  }
}
