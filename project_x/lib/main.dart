import 'package:flutter/material.dart';
import 'phoneotp.dart'; // Importing the phone OTP file

void main() {
  runApp(
    MaterialApp(
      home: FrontPage(),
    ),
  );
}

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProjectX'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.amberAccent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/frontcover.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneEntryPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue[200]), // Soft blue color
                  ),
                  child: Text('Login as User'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneEntryPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue[200]), // Soft blue color
                  ),
                  child: Text('Login as Restaurant'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
