import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.black, // Text color for the app bar title
          ),
        ),
        backgroundColor: Colors.amberAccent, // App bar background color
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, // Icon color for the app bar
        ),
      ),
      backgroundColor: Colors.amberAccent, // Scaffold background color

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    primary: Colors.blue, // Button background color
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}