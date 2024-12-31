import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefrencesDemo extends StatefulWidget {
  const SharedprefrencesDemo({super.key});

  @override
  State<SharedprefrencesDemo> createState() => _SharedprefrencesDemoState();
}

class _SharedprefrencesDemoState extends State<SharedprefrencesDemo> {
  TextEditingController nameController = TextEditingController();

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);
    prefs.setBool('isDarkMode', true);
    prefs.setInt('userAge', 25);
    prefs.setDouble('userSalary', 100000.00);
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString('username') ?? '';
  }

  Future<void> updateUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', false);
  }

  Future<void> clearPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
    prefs.clear();
  }

  @override
  void initState() {
    // TODO: implement initState

    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Storage'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            SizedBox(
              height: 120.0,
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text('Save Name'),
            ),
          ],
        ),
      ),
    );
  }
}
