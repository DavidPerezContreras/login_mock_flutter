import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xad/presentation/login/login_page.dart';
import 'package:xad/presentation/login/login_provider.dart';


class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loginProvider);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text(user.value!.username)),
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


class AuthWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loginProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: user != null ? HomePage() : LoginScreen(),
      drawer: user != null ? AppDrawer() : null,
    );
  }
}



class AppDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
 return Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/david1.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue, // Customize the header color
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home action
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('Explore'),
              onTap: () {
                // Handle Explore action
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {
                // Handle Bookmarks action
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings action
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                 ref.read(loginProvider.notifier).logout();
              },
            ),
          ],
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}