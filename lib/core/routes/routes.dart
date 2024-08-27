import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:asp_teste/views/screens/login_screen.dart';
import 'package:asp_teste/views/screens/register_screen.dart';
import 'package:asp_teste/views/home.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) {
        final userName = state.extra as String? ?? 'Usuário';
        return MyHomePage(title: 'Home', userName: userName);
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: routers,
    );
  }
}

void main() {
  runApp(const MyApp());
}
