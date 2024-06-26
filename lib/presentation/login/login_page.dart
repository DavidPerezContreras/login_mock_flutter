import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xad/presentation/login/login_provider.dart';
import 'package:xad/presentation/register/register_screen.dart';

class LoginScreen extends ConsumerWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
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
                  child: Text("Login"),
                  onPressed: () {
                    // Call the login method here
                    // Example: authProvider.login(emailController.text, passwordController.text);
                     ref.read(loginProvider.notifier).login(emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    primary: Colors.black, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Button border radius
                    ),
                    shadowColor: Colors.grey, // Shadow color
                    elevation: 5, // Shadow elevation
                  ),
                ),
                SizedBox(height: 16), // Add some spacing
                TextButton(
                  onPressed: () {
                    // Navigate to the registration screen
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue, // Button text color
                      decoration: TextDecoration.underline,
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