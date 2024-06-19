import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _homeLocationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _homeLocationController.text = prefs.getString('homeLocation') ?? '';
    });
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('homeLocation', _homeLocationController.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Profile Saved'),
    ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _homeLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                    fillColor: Color.fromARGB(255, 239, 232, 232),
                    filled: true,
              ),
            ),
            SizedBox(height:20),
            TextField(
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                    fillColor: Color.fromARGB(255, 239, 232, 232),
                    filled: true,
              ),
            ),
            SizedBox(height:20),
            TextField(
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
              controller: _homeLocationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                    fillColor: Color.fromARGB(255, 239, 232, 232),
                    filled: true,
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                _saveProfile();
              },
              child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      "Save Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
