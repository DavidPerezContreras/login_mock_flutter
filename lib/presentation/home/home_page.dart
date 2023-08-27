import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xad/presentation/login/login_provider.dart';


class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loginProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, "+(user.value!=null?user.value!.username:" Guest!")),
            ElevatedButton(
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}