import 'package:flutter/material.dart';
import 'splash.dart'; // Pastikan file splash.dart ada di folder yang sama

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // Daftar route
      routes: {
        '/': (context) => SplashScreen(), // Splash screen sebagai layar pertama
        '/home': (context) => HomeScreen(), // Home screen sebagai tujuan setelah splash
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to Home Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
