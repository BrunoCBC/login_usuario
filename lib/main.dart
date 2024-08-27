import 'package:asp_teste/domain/entity/user.dart';
import 'package:asp_teste/helper/user_manager.dart';
import 'package:asp_teste/views/screens/login_screen.dart';
import 'package:asp_teste/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
  _setupTestUser();
}

Future<void> _setupTestUser() async {
  final userManager = UserManager();
  final testUser = User(
    id: Uuid().v4(),
    username: 'testuser',
    password: 'testpassword',
    email: 'testuser@example.com',
    name: 'Test User',
    phone: '1234567890',
  );
  await userManager.addUser(testUser);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}