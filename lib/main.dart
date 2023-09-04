import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xad/presentation/home/home_page.dart';
import 'package:xad/presentation/login/login_page.dart';
import 'package:xad/presentation/login/login_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    Widget homeWidget;

    if (loginState is AsyncData<User?>) {
      if (loginState.value != null) {
        homeWidget = HomePage();
      } else {
        homeWidget = LoginScreen();
      }
    } else {
      homeWidget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      title: 'My App',
        theme: ThemeData(

        //primaryColor: Color(0xFF008080), // Custom primary color

        colorSchemeSeed: Color.fromARGB(255, 255, 0, 0), // Custom accent color
        fontFamily: 'Raleway',           // Custom font
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: homeWidget,
    );
  }
}