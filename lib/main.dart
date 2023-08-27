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

    return MaterialApp(
      home: loginState.when(

        data: (user) => user != null ? HomePage() : LoginPage(),


        loading: () => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(),
            ),
          ),
        ), // Show loading overlay

        error: (object, stacktrace) => LoginPage(), // Handle error if needed

        
      ),
    );
  }
}
