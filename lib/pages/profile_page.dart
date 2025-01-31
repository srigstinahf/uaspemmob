import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int readBooks = 0;
  String name = "Sofia";
  String email = "admin@email.com";

  @override
  void initState() {
    super.initState();
    _checkAndResetUserData();
  }

  Future<void> _checkAndResetUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load previous name and email
    String? savedName = prefs.getString('saved_name');
    String? savedEmail = prefs.getString('saved_email');

    if (savedName != name || savedEmail != email) {
      // Reset read books if name or email is different
      await prefs.remove('read_books');
      await prefs.setString('saved_name', name);
      await prefs.setString('saved_email', email);
      setState(() {
        readBooks = 0;
      });
    } else {
      // Load the number of books read
      setState(() {
        readBooks = (prefs.getStringList('read_books') ?? []).length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Profile-Picture.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Name: $name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Text(
                "Books Read: $readBooks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
